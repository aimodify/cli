<?php

function array_prepend_keys(&$array, $delimeter = ": "){
    
    foreach ($array as $key => &$value) {
        $value = $key.$delimeter.$value;
    }
    
    return $array;
}

function array_prepend_to_values(&$array, $symbol){
    foreach ($array as &$value) {
        $value = $symbol. $value;
    }
    return $array;
}


function lines($array, $newLine = PHP_EOL){
    return implode($newLine, $array);
}


function array_sql_columns($values){
    return "(`".implode("`, `", $values)."`)";
}

/**
 * Prepare $values to use with mysql IN statement.
 * via imploding
 * @param type $values
 * @param type $withoutBrackets
 * @return type
 */
function array_sql_values($values, $withoutBrackets = FALSE){
    
    if (!is_array($values)) {
        $values = [$values];
    }
    $left = "(";
    $right = ")";
    
    if ($withoutBrackets) {
        $left = "";
        $right = "";
    }
    return "{$left}'".implode("', '", $values)."'{$right}";
}


function methods($object) {
    $reflect = new \ReflectionClass(get_class($object));
    $methods = [];
    foreach ($reflect->getMethods() as $method) {
        $mData = [];
        $m = new ReflectionMethod($method->class, $method->name);
        $doc = $m->getDocComment();

        $params = [];
        foreach ($m->getParameters() as $param) {
            
            $params[$param->getPosition()] = [
                "required"=>$param->isOptional()?0:1,
                "name"=>$param->name,
//                "class"=>$param->getClass(),
                "is_array"=>$param->isArray()?:0
            ];
            
            if ($param->isDefaultValueAvailable()) {
                $params["default"]= $param->getDefaultValue();
            }
        }
        $names = array_pluck(array_filter($params, function($item){
            
            if (isset($item["required"]) && $item["required"]) {
                return true;
            }
            if (isset($item["default"]) && $item["default"]) {
                return true;
            }
        }), "name");
        
//        $names = array_prepend_keys($p, "name");
        $names = array_prepend_to_values($names, "$");
        
//        $methods[$method->name] = $params;
    
        $mData["params"] = $params;
        $mData["name"] = $method->getName();
        $mData["doc"] = $method->getDocComment();
//        $mData["return"] = $method->returnsReference();
        $mData["description"] = str_replace(PHP_EOL, "", trim(str_replace(array('/', '*'), '', substr($mData["doc"], 0, strpos($mData["doc"], '@')))));
        $mData["string"] = $mData["name"]."(".implode(", ", $names).")";
        
        $methods[]= $mData;
        
        
        
//        $methods[]= $str;
    }
    return array_pluck(collect($methods)->sortBy("name")->all(), "description", "string");
}


function arrayassoc_to_json($data){
    
    $temp = [];
    foreach ($data as $key => $value) {
        
        if (is_array($value)) {
            $value = arrayassoc_to_json($value);
        }
        $temp[]= [$key, $value];
    }
    return $temp;

    
}


/**
 * @return 
 */
function timestamps_from_date($year, $month) {

     $start = strtotime("{$year}-{$month}-01 00:00:00");
     $lastDay = date("t", strtotime("{$year}-{$month}-01"));
     
     $end = strtotime("{$year}-{$month}-{$lastDay} 23:59:59");
     
     return [$start, $end];
}


function nestobject_to_array($object) {
    
    return json_decode(json_encode($object), TRUE);
}

function tsFrom($year, $month, $day){
        return strtotime("{$year}-{$month}-{$day} 00:00:00")*1000;
}
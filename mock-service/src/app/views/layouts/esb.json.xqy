xquery version "1.0-ml";

import module namespace vh = "http://marklogic.com/roxy/view-helper" at "/roxy/lib/view-helper.xqy";

declare variable $error as item()* := vh:get("error");
declare variable $view as item()* := vh:get("view");

$view
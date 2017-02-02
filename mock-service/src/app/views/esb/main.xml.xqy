xquery version "1.0-ml";

import module namespace vh = "http://marklogic.com/roxy/view-helper" at "/roxy/lib/view-helper.xqy";

declare option xdmp:mapping "false";

declare variable $response := vh:get("response");

($response, xdmp:set-response-content-type("application/xml"), xdmp:set-response-code(200, "OK") )
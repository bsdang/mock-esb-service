xquery version "1.0-ml";

import module namespace vh = "http://marklogic.com/roxy/view-helper" at "/roxy/lib/view-helper.xqy";
import module namespace json = "http://marklogic.com/roxy/simple-json-lib" at "/app/views/helpers/simple-json-lib.xqy";


declare option xdmp:mapping "false";

declare variable $response as node()* := vh:get("response");

if (fn:empty($response)) then '{}'
else json:o(( fn:local-name($response), json:iv(( $response/xs:string(.) )) ))

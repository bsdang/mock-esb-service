(:
Copyright 2012-2015 MarkLogic Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
:)
xquery version "1.0-ml";

module namespace c = "http://marklogic.com/roxy/controller/esb";

(: the controller helper library provides methods to control which view and template get rendered :)
import module namespace ch = "http://marklogic.com/roxy/controller-helper" at "/roxy/lib/controller-helper.xqy";

(: The request library provides awesome helper methods to abstract get-request-field :)
import module namespace req = "http://marklogic.com/roxy/request" at "/roxy/lib/request.xqy";
import module namespace json="http://marklogic.com/xdmp/json" at "/MarkLogic/json/json.xqy";

declare namespace j = "http://marklogic.com/xdmp/json/basic";

declare option xdmp:mapping "false";

declare function c:main() as item()*
{
  let $body := xdmp:get-request-body()
  let $_log := xdmp:log( fn:concat(" *** Message Received by Mock ESB SERVICE ***",  $body), "info")   
  let $id := json:transform-from-json($body)/j:id
  let $_ := xdmp:document-insert($id, $body)
  let $_log := xdmp:log( fn:concat(" *** ID ***",  $id), "info")  
  return (
     ch:add-value("response", $id),
     ch:set-format("json"),
     ch:use-view(('esb/empty-view'), "json"),
     ch:use-layout(("esb"), "json")
   )
};


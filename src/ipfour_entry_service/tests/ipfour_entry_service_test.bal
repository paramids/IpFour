import ballerina/artemis;
import ballerina/log;
import ballerina/test;



@test:Config
function testEndpointDataDelivery() {

  var err = prod->send("Hello World!");


}
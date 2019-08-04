import ballerina/artemis;
import ballerina/log;
import ballerina/test;


@test:Config



artemis:Producer prod = new({host:"localhost", port:61616}, "/ipc/v1/1",
  addressConfig = {routingType:artemis:MULTICAST});

function testEndpointDataDelivery() {
  var err = prod->send("Hello World!");
    if (err is error) {
        log:printError("Error occurred while sending message", err = err);
    }

    if (!prod.isClosed()) {
        err = prod->close();
        if (err is error) {
            log:printError("Error occurred closing producer", err = err);
        }
    }


}
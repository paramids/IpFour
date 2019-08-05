// Copyright (c) 2018 Ipanera Labs (http://www.ipaneralabs.org) All Rights Reserved.
//
// Ipanera Labs licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

//This code tests the MQTT service which all clients subsribe. The subscription server uses
//Apache ActiveMQ Artemis as an embedded message brokering service. This service implements the basic ipc protocol

import ballerina/artemis;
import ballerina/log;
import ballerina/test;

@test:Config
public function main() {

  artemis:Producer prod = new({host:"localhost", port:61616}, "kp1.app1.instance1.extension1",
  addressConfig = {routingType:artemis:MULTICAST});
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

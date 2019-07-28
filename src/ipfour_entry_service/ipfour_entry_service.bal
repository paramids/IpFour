// Copyright (c) 2018 Ipanera Labs (http://www.wso2.org) All Rights Reserved.
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

//This code attempts to create an MQTT service which all clients subsribe. The subscription server uses
//Apache ActiveMQ Artemis as an embedded message brokering service. This service implements the basic ipc protocol

import ballerina/artemis;
import ballerina/http;
import ballerina/log;


artemis:Connection con = new("tcp://localhost:60616");
artemis:Session session = new(con);

@artemis:ServiceConfig{
    queueConfig:{
        queueName: "queue1",
        addressName: "/ipc/ver1/"
    }


}
service artemisconsumer on new artemis:Listener(session){

    resource function onMessage(artemis:Message message){
        var payload = message.getPayload();
    }
}


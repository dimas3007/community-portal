<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chat App | coderstea.in</title>
</head>
<body>
            <div class="container">

            <div class="py-5 text-center">

                <h2>WebSocket</h2>

                <p class="lead">WebSocket Broadcast - with STOMP & SockJS.</p>

            </div>

            <div class="row">

                <div class="col-md-6">

                    <div class="mb-3">

                        <div class="input-group">

                            <input type="text" id="from" class="form-control" placeholder="Choose a nickname"/>

                            <div class="btn-group">

                                <button type="button" id="connect" class="btn btn-sm btn-outline-secondary" onclick="connect()">Connect</button>

                            <button type="button" id="disconnect" class="btn btn-sm btn-outline-secondary" onclick="disconnect()" disabled>Disconnect</button>

                            </div>                        

                        </div>

                    </div>

                    <div class="mb-3">

                        <div class="input-group" id="sendmessage" style="display: none;">

                            <input type="text" id="message" class="form-control" placeholder="Message">

                            <div class="input-group-append">

                                <button id="send" class="btn btn-primary" onclick="send()">Send</button>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-6">

                    <div id="content"></div>

                    <div>

                        <span class="float-right">

                            <button id="clear" class="btn btn-primary" onclick="clearBroadcast()" style="display: none;">Clear</button>

                        </span>

                    </div>                    

                </div>

            </div>

        </div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="../../assets/js/chat.js"></script>
    </body>
</html>
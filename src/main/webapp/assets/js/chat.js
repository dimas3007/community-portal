            var stompClient = null;

            

            function setConnected(connected) {

                $("#from").prop("disabled", connected);

                $("#connect").prop("disabled", connected);

                $("#disconnect").prop("disabled", !connected);

                if (connected) {

                    $("#sendmessage").show();

                } else {

                    $("#sendmessage").hide();

                }

            }

            

            function connect() {

                var socket = new SockJS('http://localhost:9092/ws');

                stompClient = Stomp.over(socket);
                
                 stompClient.connect({}, (frame) => {
					console.error(frame);
			        console.error('yeah you connected');
			      }, () => {
			        console.error('Sorry, I cannot connect to the server right now.');
			      });

                stompClient.connect({}, function () {
	console.log("connect woy")

                    stompClient.subscribe('/chatroom/public', function (output) {

                        showBroadcastMessage(createTextNode(JSON.parse(output.body)));

                    });

                    

                    sendConnection(' connected to server');                

                    setConnected(true);

                }, function (err) {

                    alert('error' + err);

                });                

            }

 

            function disconnect() {

                if (stompClient != null) {

                    sendConnection(' disconnected from server'); 

                    

                    stompClient.disconnect(function() {

                        console.log('disconnected...');

                        setConnected(false);

                    });                    

                }                

            }

            

            function sendConnection(message) {

                var from = $("#from").val();

                var text = from + message;

                clientSend({'from': 'server', 'text': text});

            }

            

            function clientSend(json) {

                stompClient.send("/app/message", {}, JSON.stringify(json));

            }

            

            function send() {

                var from = $("#from").val();

                var text = $("#message").val();

                clientSend({'from': from, 'text': text});                

                $("#message").val("");

            }

 

            function createTextNode(messageObj) {

                return '<div class="row alert alert-info"><div class="col-md-8">' +

                        messageObj.text +

                        '</div><div class="col-md-4 text-right"><small>[<b>' +

                        messageObj.from +

                        '</b> ' +

                        messageObj.time + 

                        ']</small>' +

                        '</div></div>';

            }

            

            function showBroadcastMessage(message) {

                $("#content").html($("#content").html() + message);

                $("#clear").show();

            }

            

            function clearBroadcast() {

                $("#content").html("");

                $("#clear").hide();

            }
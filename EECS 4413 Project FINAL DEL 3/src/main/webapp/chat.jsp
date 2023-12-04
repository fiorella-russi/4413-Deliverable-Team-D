

<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" type="text/css" href="styles/chat.css">
</head>
<body>

<div id="chat-container">
    <div id="chat-button" onclick="toggleChat()">Chat</div>
    <div id="chat-popup">
        <div id="chat-header">
            <span>Customer Support</span>
            <button id ="close-button" type="button" onclick="toggleChat()">-</button>
        </div>
        <div id="chat-content">
            <div id="chat-messages">
            <p id = "response"><strong>Bot: </strong>Hello, welcome to e-Carmerce! I'm here to help you navigate our site.
            Type "HELP" to see a list of predefined questions.</p>
            </div>
            <input id="chatEnter" type="text" placeholder="Type your message here...">
            <input id="chatSubmit" type="submit" onclick="sendQuestion()"></input>
        </div>
    </div>
</div>

<script>
    function sendQuestion() {
    
    	console.log("hi");
        var inputElement = document.getElementById('chatEnter');
        var question = inputElement.value;
        if(question!==''){
        inputElement.value = ''; 
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'ChatBotServlet', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = xhr.responseText;
                var messagesContainer = document.getElementById('chat-messages');
                messagesContainer.innerHTML += '<div id=\'response1\'><strong>You:</strong> ' + question + '</div><br>';
                messagesContainer.innerHTML += '<div id=\'response\'><strong>Bot:</strong> ' + response + '</div><br>';
                messagesContainer.scrollTop = messagesContainer.scrollHeight; 
                scrollToTop();
            }
        };
        }
        xhr.send('question=' + encodeURIComponent(question));
        
    }

    function toggleChat() {
        var chatPopup = document.getElementById('chat-popup');
        var chatButton = document.getElementById('chat-button');
        var chatSubmit = document.getElementById('chatSubmit');
        if (chatPopup.style.display === 'none') {
            chatPopup.style.display = 'block';
            chatButton.style.display = 'none'
 
            
        
        } else {
            chatPopup.style.display = 'none';
            chatButton.innerText = 'Chat';
            chatButton.style.display = 'block'
        }
    }
    function scrollToBottom() {
        var messagesContainer = document.getElementById('chat-messages');
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
   
   
</script>

</body>
</html>



<!DOCTYPE html>
<html>
<head>
    <title>Chat Popup</title>
    <link rel="stylesheet" type="text/css" href="styles/chat.css">
</head>
<body>

<div id="chat-container">
    <div id="chat-button" onclick="toggleChat()">Chat</div>
    <div id="chat-popup">
        <div id="chat-header">
            <span>Customer Support</span>
            <button type="button" onclick="toggleChat()">-</button>
        </div>
        <div id="chat-content">
            <div id="chat-messages">
            <p><strong>Bot: </strong>Hello, welcome to e-Carmerce! I'm here to help you navigate our site.
            Type "HELP" to see a list of predefined questions.</p>
            </div>
            <input type="text" id="chat-input" placeholder="Type your message here...">
            <button type="button" onclick="sendQuestion()">Send</button>
        </div>
    </div>
</div>

<script>
    function sendQuestion() {
        var inputElement = document.getElementById('chat-input');
        var question = inputElement.value;
        inputElement.value = ''; 
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'ChatBotServlet', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = xhr.responseText;
                var messagesContainer = document.getElementById('chat-messages');
                messagesContainer.innerHTML += '<div><strong>You:</strong> ' + question + '</div><br>';
                messagesContainer.innerHTML += '<div><strong>Bot:</strong> ' + response + '</div><br>';
                messagesContainer.scrollTop = messagesContainer.scrollHeight; 
            }
        };
        xhr.send('question=' + encodeURIComponent(question));
        
    }

    function toggleChat() {
        var chatPopup = document.getElementById('chat-popup');
        var chatButton = document.getElementById('chat-button');
        if (chatPopup.style.display === 'none') {
            chatPopup.style.display = 'block';
            chatButton.innerText = 'Close';
        } else {
            chatPopup.style.display = 'none';
            chatButton.innerText = 'Chat';
        }
    }
</script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .calculator {
            max-width: 300px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .display {
            width: 100%;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            text-align: right;
            border: none;
            border-radius: 10px;
            background-color: #f5f5f5;
            color: #333;
        }
        .button {
            width: 60px;
            height: 60px;
            margin: 5px;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        .button:hover {
            background-color: #3e8e41;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <input type="text" id="display" class="display" disabled>
        <div class="row">
            <button class="button" onclick="clearDisplay()">C</button>
            <button class="button" onclick="handleClick('%')">%</button>
            <button class="button" onclick="handleClick('/')">/</button>
            <button class="button" onclick="handleClick('*')">*</button>
        </div>
        <div class="row">
            <button class="button" onclick="handleClick(7)">7</button>
            <button class="button" onclick="handleClick(8)">8</button>
            <button class="button" onclick="handleClick(9)">9</button>
            <button class="button" onclick="handleClick('-')">-</button>
        </div>
        <div class="row">
            <button class="button" onclick="handleClick(4)">4</button>
            <button class="button" onclick="handleClick(5)">5</button>
            <button class="button" onclick="handleClick(6)">6</button>
            <button class="button" onclick="calculate()">=</button>
        </div>
        <div class="row">
            <button class="button" onclick="handleClick(1)">1</button>
            <button class="button" onclick="handleClick(2)">2</button>
            <button class="button" onclick="handleClick(3)">3</button>
            <button class="button" onclick="handleClick('+')">+</button>
        </div>
        <div class="row">
            <button class="button" onclick="handleClick(0)">0</button>
            <button class="button" onclick="handleClick('.')">.</button>
        </div>
        <button class="button" onclick="showHistory()">History</button>
    </div>
    <div id="history-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeHistory()">&times;</span>
            <h5>Calculation History:</h5>
            <div id="history"></div>
        </div>
    </div>
    <script>
        let display = document.getElementById('display');
        let historyElement = document.getElementById('history');
        let historyModal = document.getElementById('history-modal');
        let history = [];
        let currentExpression = '';

        function handleClick(value) {
            currentExpression += value.toString();
            display.value = currentExpression;
        }

        function calculate() {
            try {
                let result = eval(currentExpression);
                if (!isNaN(result) && currentExpression.trim() !== '') { 
                    history.push(`${currentExpression} = ${result}`);
                    updateHistory();
                }
                display.value = result;
                currentExpression = result.toString();
            } catch (e) {
                display.value = 'Error';
                currentExpression = '';
            }
        }

        function clearDisplay() {
            display.value = '';
            currentExpression = '';
        }

        function updateHistory() {
            historyElement.innerHTML = '';
            history.forEach(item => {
                let p = document.createElement('p');
                p.textContent = item;
                historyElement.appendChild(p);
            });
        }

        function showHistory() {
            updateHistory();
            historyModal.style.display = 'block';
        }

        function closeHistory() {
            historyModal.style.display = 'none';
        }
    </script>
</body>
</html>
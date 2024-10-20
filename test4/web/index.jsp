<%--
  Created by IntelliJ IDEA.
  User: aur
  Date: 2024/10/20
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>个税计算</title>
  <script>
    function callWebService() {
      var xhr = new XMLHttpRequest();
      var salary = document.getElementById("salary").value; // 获取输入的月薪值
      xhr.open("POST", "http://localhost:8088/TaxCalculation", true);
      xhr.setRequestHeader("Content-Type", "application/soap+xml; charset=utf-8");
      xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var response = xhr.responseText;
          // 解析响应并更新页面
          console.log(response);
          // 你可以在这里将响应结果显示在页面上
        }
      };
      var soapRequest = "<soapenv:Envelope xmlns:soapenv='http://schemas.xmlsoap.org/soap/envelope/' xmlns:tax='http://example/tax/'><soapenv:Header/><soapenv:Body><tax:calculateTax><tax:salary>" + salary + "</tax:salary></tax:calculateTax></soapenv:Body></soapenv:Envelope>";
      xhr.send(soapRequest);
//       var xhr = new XMLHttpRequest();
//       xhr.open("POST", "http://localhost:8088/TaxCalculation", true);
//       xhr.setRequestHeader("Content-Type", "text/xml; charset=utf-8");
//       xhr.setRequestHeader("SOAPAction", "http://8088/taxCalculation");
//
//       xhr.onreadystatechange = function () {
//         if (xhr.readyState == 4 && xhr.status == 200) {
//           var response = xhr.responseXML;
//           var tax = response.getElementsByTagName("taxCalculationReturn")[0].textContent;
//           console.log("The calculated tax is: " + tax);
//         }
//       };
//
//       var soapRequest = `
//     <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
//                       xmlns:tax="http://8088/">
//         <soapenv:Header/>
//         <soapenv:Body>
//             <tax:taxCalculation>
//                 <tax:salary>5000.0</tax:salary>
//             </tax:taxCalculation>
//         </soapenv:Body>
//     </soapenv:Envelope>
// `;
//
//       xhr.send(soapRequest);
    }
  </script>
</head>
<body>
<form onsubmit="event.preventDefault(); callWebService();">
  月薪<br>
  <input type="number" id="salary" name="salary" step="0.01">
  <input type="submit" value="计算">
</form>
</body>
</html>

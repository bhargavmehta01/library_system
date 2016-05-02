<%@page import="VO.ChiefEditor"%>
<%@page import="VO.Author"%>
<%@page import="VO.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function myFunc() {

		var sel = document.getElementById("docType").value

		if (sel == "book") {
			document.getElementById("bookdiv1").style.display = "";
			document.getElementById("bookdiv2").style.display = "";
			document.getElementById("journaldiv1").style.display = "none";
			document.getElementById("journaldiv2").style.display = "none";
			document.getElementById("journaldiv3").style.display = "none";
			document.getElementById("journaldiv4").style.display = "none";
			document.getElementById("proceedingdiv1").style.display = "none";
			document.getElementById("proceedingdiv2").style.display = "none";
			document.getElementById("proceedingdiv3").style.display = "none";
		} else if (sel == "journal") {
			document.getElementById("journaldiv1").style.display = "";
			document.getElementById("journaldiv2").style.display = "";
			document.getElementById("journaldiv3").style.display = "";
			document.getElementById("journaldiv4").style.display = "";
			document.getElementById("bookdiv1").style.display = "none";
			document.getElementById("bookdiv2").style.display = "none";
			document.getElementById("proceedingdiv1").style.display = "none";
			document.getElementById("proceedingdiv2").style.display = "none";
			document.getElementById("proceedingdiv3").style.display = "none";
		} else if (sel == "proceeding") {
			document.getElementById("proceedingdiv1").style.display = "";
			document.getElementById("proceedingdiv2").style.display = "";
			document.getElementById("proceedingdiv3").style.display = "";
			document.getElementById("bookdiv1").style.display = "none";
			document.getElementById("bookdiv2").style.display = "none";
			document.getElementById("journaldiv1").style.display = "none";
			document.getElementById("journaldiv2").style.display = "none";
			document.getElementById("journaldiv3").style.display = "none";
			document.getElementById("journaldiv4").style.display = "none";
		} else if (sel == "nothing") {
			document.getElementById("bookdiv").style.display = "none";
			document.getElementById("journaldiv1").style.display = "none";
			document.getElementById("journaldiv2").style.display = "none";
			document.getElementById("journaldiv3").style.display = "none";
			document.getElementById("journaldiv4").style.display = "none";
			document.getElementById("proceedingdiv1").style.display = "none";
			document.getElementById("proceedingdiv2").style.display = "none";
			document.getElementById("proceedingdiv3").style.display = "none";
		}

	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="document">

		<fieldset>
			<legend align="center">INSERT DOCUMENT</legend>
			<table align="center">
				<tr>
					<td align="left">Title:</td>
					<td align="center"><input type="text" name="title"></td>
				</tr>
				<tr>
					<td align="left">Publisher name:</td>
					<td><select name="pubid">
							<%
								ArrayList<Publisher> arr = (ArrayList<Publisher>) session.getAttribute("pubData");

								for (int i = 0; i < arr.size(); i++) {
									Publisher p = arr.get(i);
							%>
							<option value="<%=p.getId()%>"><%=p.getPubname()%></option>

							<%
								}
							%>

					</select></td>
				</tr>
				<tr>
					<td align="left">Published date:</td>
					<td align="center"><input type="date" name="pubdate"></td>
				</tr>
				<tr>
					<td align="left">Document type:</td>
					<td><select name="docType" id="docType" onchange="myFunc()">
							<option value="nothing">---</option>
							<option value="book">Book</option>
							<option value="journal">Journal</option>
							<option value="proceeding">Proceeding</option>
					</select></td>
				</tr>
				<tr id="bookdiv1" style="display:none">
					<td align="center">ISBN:</td>
					<td align="center"><input type="text" name="isbn"></td>
				</tr>
				<tr id="bookdiv2" style="display:none">
					<td align="center">Author</td>
					<td><select name="authid">
							<%
								ArrayList<Author> arr2 = (ArrayList<Author>) session.getAttribute("authData");

								for (int i = 0; i < arr2.size(); i++) {
									Author a = arr2.get(i);
							%>
							<option value="<%=a.getAuthid()%>"><%=a.getAuthname()%></option>

							<%
								}
							%>

					</select></td>
				</tr>
				<tr id="journaldiv1" style="display:none">
					<td align="center">Volume:</td>
					<td align="center"><input type="text" name="jvolume"></td>
				</tr>
				<tr id="journaldiv2" style="display:none">
					<td align="center">EditorID:</td>
					<td align="center"><input type="text" name="editorid"></td>
				</tr>
				<tr id="journaldiv3" style="display:none">
					<td align="center">IssueNO:</td>
					<td align="center"><input type="text" name="issueno"></td>
				</tr>
				<tr id="journaldiv4" style="display:none">
					<td align="center">Scope:</td>
					<td align="center"><input type="text" name="scope"></td>
				</tr>

				<tr id="proceedingdiv1" style="display:none">
					<td align="center">Date:</td>
					<td align="center"><input type="date" name="cdate"></td>
				</tr>
				<tr id="proceedingdiv2" style="display:none">
					<td align="center">Location:</td>
					<td align="center"><input type="text" name="clocation"></td>
				</tr>
				<tr id="proceedingdiv3" style="display:none">
					<td align="center">Editor:</td>
					<td><select name="chiefid">
							<%
								ArrayList<ChiefEditor> arr3 = (ArrayList<ChiefEditor>) session.getAttribute("chiefData");

								for (int i = 0; i < arr3.size(); i++) {
									ChiefEditor c = arr3.get(i);
							%>
							<option value="<%=c.getEid()%>"><%=c.getEname()%></option>

							<%
								}
							%>

					</select></td>
				</tr>

				<tr>
					<td><input type="hidden" name="operation" value="insert"></td>
					<td align="center"><input type="submit" value="Submit"></td>
				</tr>

			</table>
		</fieldset>
	</form>
</body>
</html>
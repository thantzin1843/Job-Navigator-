<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
int companyId = (Integer) session.getAttribute("companyId");
session.setAttribute("companyId", companyId);

int ppoints = (Integer) session.getAttribute("purchasedPoints");
session.setAttribute("purchasedPoints", ppoints);

int pid = (Integer) session.getAttribute("package_id");
session.setAttribute("package_id", pid);


%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Job Navigator</title>

<script src="https://cdn.tailwindcss.com"></script>
<script>
        tailwind.config = {
            theme: {
               extend:{
                  width: {
                  'custom-xsm': '3rem',
                  'custom-sm': '8rem', 
                  'custom-md': '12rem', 
                  'custom-lg': '16rem', 
                  'custom-xl': '20rem', 
                  },
                  height: {
                  'custom-xsm': '3rem',
                  'custom-sm': '8rem', 
                  'custom-md': '12rem', 
                  'custom-lg': '16rem', 
                  'custom-xl': '20rem', 
                  },
                  screens: {
                  'sm': '640px',
                  'md': '768px',
                  'lg': '1024px',
                  'xl': '1280px',
                  '2xl': '1536px',
                  },
                },
               fontFamily: {
                cabin: ['Cabin', 'sans-serif'],
               },
          }
            
        }
    </script>



<!--cabin font-->
<link href='https://fonts.googleapis.com/css?family=Cabin'
	rel='stylesheet'>
<!--icons-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
@charset "ISO-8859-1";

@media ( max-width : 850px) {
	.container {
		min-width: 800px;
	}
}

@media ( max-width : 700px) {
	.container {
		min-width: 600px;
	}
}

.qr_part {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin: 30px 0px 30px 0px;
}

.drag-area {
	border: 2px dashed #fff;
	/* min-height: 200px;
    min-width: 230px; */
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	margin-top: 30px;
	padding: 2px;
}

.drag-area.active {
	border: 2px solid #fff;
}

.drag-area .icon {
	font-size: 30px;
	color: #fff;
}

.drag-area header {
	font-size: 15px;
	font-weight: 400;
	color: #fff;
}

.drag-area span {
	font-size: 15px;
	font-weight: 500;
	color: #fff;
	margin: 10px 0 15px 0;
}

.drag-area button {
	padding: 8px 20px;
	font-size: 15px;
	font-weight: 450;
	border: none;
	outline: none;
	background: #fff;
	color: #5256ad;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.5s;
}

.drag-area button:hover {
	background: rgb(228, 220, 220);
}

.drag-area img {
	height: 100%;
	width: 100%;
	object-fit: contain;
	border-radius: 5px;
}

.btns {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin: 20px 150px 20px 150px;
}

.last_btn {
	margin: 20px 0px 20px 0px;
}

.section-with-background {
	height: auto;
}

@media ( max-width : 800px) {
	.pay-img {
		min-height: 200px;
		min-width: 230px;
	}
	.drag-area {
		min-height: 200px;
		min-width: 230px;
	}
}

.glass-effect {
	backdrop-filter: blur(10px);
	background: rgba(255, 255, 255, 0.2);
	border: 1px solid rgba(255, 255, 255, 0.3);
}

.disabled-background {
	pointer-events: none;
	filter: blur(5px);
}
</style>


</head>
<body class="font-cabin">

	<div class="container max-w-screen-xl mx-auto px-0 h-screen">
		<div
			class="grid grid-cols-2 gap-4 bg-white my-8 font-cabin w-full h-full"
			id="payment_show">

			<!-- col 1 -->
			<div class="px-4 w-full h-full ml-5">
				<a href="home.html">
					<h6 class="text-base font-medium">
						<i class="fa-solid fa-arrow-left"> </i> Back
					</h6>
				</a>


				<div class="left-container mt-5 ml-3 mr-10">
					<h2 class="text-xl font-bold">Payment</h2>

					<p class="mt-5 ml-2 text-[#858181] text-sm">You choose:</p>

					<div
						class=" mt-2 ml-2 w-full min-w-min border-2 border-[#7905EE] rounded p-2 flex flex-row flex-wrap justify-between ">
						<div class="flex flex-row flex-nowrap">
							<img src="${pageContext.request.contextPath}/resources/images/icons/pointsIcon.png" class="w-8 h-8" />
							<h4 class="text-lg mt-0.5">${choosePackage.points} points</h4>
						</div>
						<div>
							<h4 class="text-[#7905EE] text-lg ml-5">${choosePackage.cost}
								MMK</h4>
						</div>
					</div>
					
					<p class="mt-8 ml-2 text-[#858181] text-sm">Choose payment
						Options:</p>

					<div class="mt-1 mx-5 flex flex-row flex-wrap justify-between ">

						<button
							class="mt-1 width-70 h-fit bg-white shadow-lg px-10 py-3 rounded border-2 border-gray-200"
							id="kbz">
							<img src="${pageContext.request.contextPath}/resources/images/payment/kbzpay.jpg" class="w-10 h-10">
							<p class="mt-1 font-bold">KBZ pay</p>

						</button>

						<button
							class="mt-1 width-70 h-fit bg-white shadow-md px-10 py-3 rounded border-2 border-gray-200"
							id="aya">
							<img src="${pageContext.request.contextPath}/resources/images/payment/ayapay.png" class="w-10 h-10">
							<p class="mt-1 font-bold">Aya Pay</p>

						</button>

						<button
							class="mt-1 w-70 h-auto bg-white shadow-md px-10 py-3 rounded border-2 border-gray-200"
							id="wave">
							<img src="${pageContext.request.contextPath}/resources/images/payment/wave-money.jpg" class=" w-10 h-10">
							<p class="mt-1 font-bold">Wave Pay</p>

						</button>



					</div>

					<!--<p class="mt-8 ml-2 text-[#858181] text-sm">Notes:</p>

					
						<textarea
							class="ml-2 my-2 w-full min-w-min border-2 border-[#7905EE] rounded"> </textarea>
						<!--<input type="text" placeholder="Please enter short notes" class="ml-2 my-2 max-w-lg min-w-min border-2 border-[#7905EE] rounded" /> -->
						<button 
							class="mr-5 mt-6 bg-[#7905EE] border rounded-3xl text-white p-2 w-20 h-10 float-right disabled:bg-gray-400 disabled:cursor-not-allowed"
							disabled id="done">Done</button>
						<!-- <a href="/Final_JN/point_purchase/payment/${sessionScope.package_id}"><button 
							class="mr-5 mt-6 bg-[#7905EE] border rounded-3xl text-white p-2 w-20 h-10 float-right disabled:bg-gray-400 "
							disabled id="cancel">Cancel</button> 
						</a> -->
						
					
					

				</div>
			</div>

			<!-- col 2 -->
			<div>
				<!-- not choosen -->
				<div
					class="bg-[#DAD6D6] rounded-tl-xl rounded-bl-xl w-full h-full px-20"
					id="show_error" style="display: block;">
					<div
						class="w-full h-full flex flex-col justify-center items-center">
						<img src="${pageContext.request.contextPath}/resources/images/noback/nopay.png"
							class="w-60 h-60 rotate-20">
						<h6 class="font-bold text-lg">You haven’t select a payment.</h6>
						<p class="font-medium text-lg">Please select a payment to
							purchase your desired points.</p>
					</div>
				</div>

				<!-- kpay -->
				<div
					class="bg-[#9696E8] rounded-tl-xl rounded-bl-xl w-full h-full px-20"
					id="show_kpay" style="display: none;">
					<div
						class="w-full h-full px-20 flex flex-col justify-center items-center">
						<h6 class="font-bold text-xl text-white">KBZ Pay</h6>
						<p class="font-bold text-sm text-[#7905EE] text-center">Please
							scan the QR code and upload the screenshot here.</p>
						<img src="${pageContext.request.contextPath}/resources/images/payment/kpayqr.jpg"
							class="w-custom-md h-custom-md mt-2 pay-img">

						<div class="drag-area max-w-custom-md h-custom-md mt-2"
							ondrop="upload_file(event, 'drop_kpay')"
							ondragover="event.preventDefault()" id="drop_kpay"
							class="dropArea">
							<div class="icon">
								<i class="fas fa-cloud-upload-alt"></i>
							</div>
							<header>Drag & Drop to Upload Image</header>
							<span>OR</span>
							<button onclick="showFileDialog('file_kpay', 'drop_kpay')">Browse
								File</button>
						
							<input type="file" name="file" id="file_kpay" hidden
								onchange="showFile(this, 'drop_kpay')">
							
							
						</div>

					</div>
				</div>

				<!-- aya -->
				<div
					class="bg-[#9696E8] rounded-tl-xl rounded-bl-xl w-full h-full px-20"
					id="show_aya" style="display: none;">
					<div
						class="w-full h-full px-20 flex flex-col justify-center items-center">
						<h6 class="font-bold text-xl text-white">AYA Pay</h6>
						<p class="font-bold text-sm text-[#7905EE] text-center">Please
							scan the QR code and upload the screenshot here.</p>
						<img src="${pageContext.request.contextPath}/resources/images/payment/kpayqr.jpg"
							class="w-custom-md h-custom-md mt-2 pay-img">

						<div class="drag-area max-w-custom-md h-custom-md mt-2"
							ondrop="upload_file(event, 'drop_aya')"
							ondragover="event.preventDefault()" id="drop_aya"
							class="dropArea">
							<div class="icon">
								<i class="fas fa-cloud-upload-alt"></i>
							</div>
							<header>Drag & Drop to Upload Image</header>
							<span>OR</span>
							<!-- <button onclick="document.getElementById('file').click()">Browse File</button>                      
                        <input type="file" name="file" id="file" hidden> -->
							<button onclick="showFileDialog('file_aya', 'drop_aya')">Browse
								File</button>
							
							<input type="file" name="file" id="file_aya" hidden
								onchange="showFile(this, 'drop_aya')">
							
							
						</div>

					</div>
				</div>

				<!-- wave -->
				<div
					class="bg-[#9696E8] rounded-tl-xl rounded-bl-xl w-full h-full px-20"
					id="show_wave" style="display: none;">
					<div
						class="w-full h-full px-20 flex flex-col justify-center items-center">
						<h6 class="font-bold text-xl text-white">WAVE Pay</h6>
						<p class="font-bold text-sm text-[#7905EE] text-center">Please
							scan the QR code and upload the screenshot here.</p>
						<img src="${pageContext.request.contextPath}/resources/images/payment/waveqr.jpg"
							class="w-custom-md h-custom-md mt-2 pay-img">

						<div class="drag-area max-w-custom-md h-custom-md mt-2"
							ondrop="upload_file(event, 'drop_wave')"
							ondragover="event.preventDefault()" id="drop_wave"
							class="dropArea">
							<div class="icon">
								<i class="fas fa-cloud-upload-alt"></i>
							</div>
							<header>Drag & Drop to Upload Image</header>
							<span>OR</span>
							<button onclick="showFileDialog('file_wave', 'drop_wave')">Browse
								File</button>
							
							<input type="file" name="file" id="file_wave" hidden
								onchange="showFile(this, 'drop_wave')">
							
							
						</div>

					</div>
				</div>

			</div>



		</div>

		<!-- confirm alert -->

		<div id="alertBox"
			class="hidden fixed inset-0 flex justify-center items-center">
			<div
				class="glass-effect p-6 rounded-xl shadow-lg max-w-sm w-full text-center">
				<h2 class="text-xl font-bold text-black">
					<i class="fa-solid fa-circle-check" style="color: #069810;"></i>
					Thank you for your purchasing.
				</h2>
				<p class="text-black mt-4">Thank you for your purchase! We will
					contact you as soon as the payment is confirmed.</p>			
				<form:form action="/Final_JN/point_purchase/payment/payment_save" enctype="multipart/form-data" modelAttribute="Payment">
						<input type="hidden" value="kpayForm" id="hidden_payment" name="hiddenPayment" />
						<input type="file" type="file" name="file" id="hidden_file" hidden/>
						<button id="last_ok"
						class="mt-6 px-4 py-2 bg-[#7905EE] text-white rounded-lg">OK</button>
			    </form:form>
				
			</div>
		</div>

	</div>

	<!-- <script src="script.js"></script> -->
	<script type="text/javascript">
	
		 const fileInput1 = document.getElementById('file_kpay');  
	     const fileInput2 = document.getElementById('file_aya');  
	     const fileInput3 = document.getElementById('file_wave');      
	    

	      console.log('fileInput1:', fileInput1);
	      console.log('fileInput2:', fileInput2);
	      console.log('fileInput3:', fileInput3);
	      
	      console.log("After Done");
	     
	     const btn1 = document.getElementById('kpayFormbtn'); 
	     const btn2 = document.getElementById('ayaFormbtn'); 
	     const btn3 = document.getElementById('waveFormbtn'); 
	     
	     let formToSubmit = "waveForm";
	     const selectedForm = document.getElementById('hidden_payment'); 
	     
        const kbzPayButton = document.getElementById("kbz");
        const ayaPayButton = document.getElementById("aya");
        const wavePayButton = document.getElementById("wave");
        const doneButton = document.getElementById("done");
        const OkButton= document.getElementById("last_ok");
        const error = document.getElementById("show_error");
        
        var ayaDiv = document.getElementById('show_aya');
        var kpayDiv = document.getElementById('show_kpay');
        var waveDiv = document.getElementById('show_wave');
        doneButton.disabled="false";
        
        //kpay
        kbzPayButton.addEventListener("click", () => {
          
          if (kpayDiv.style.display === "none" || kpayDiv.style.display === "") {
            kbzPayButton.style.borderColor="#7905EE";
            wavePayButton.style.borderColor="#E5E7EB";
            ayaPayButton.style.borderColor="#E5E7EB";
            error.style.display = "none";
            waveDiv.style.display = "none";
            ayaDiv.style.display = "none";
            kpayDiv.style.display = "block";
            doneButton.disabled = false;
            selectedForm.value = 'kpayForm';
            formToSubmit = 'kpayForm';
            console.log(document.getElementById('hidden_payment'));
            
           
          } else {
            kbzPayButton.style.borderColor="#E5E7EB";
            waveDiv.style.display = "none";
            ayaDiv.style.display = "none";
            kpayDiv.style.display = "none";   
            error.style.display = "block";
            doneButton.disabled = true;
            selectedForm.value = 'waveForm'
          }
        });

        //Aya
        ayaPayButton.addEventListener("click", () => {
          
          if (ayaDiv.style.display === "none" || ayaDiv.style.display === "") {
            ayaPayButton.style.borderColor="#7905EE";
            wavePayButton.style.borderColor="#E5E7EB";
            kbzPayButton.style.borderColor="#E5E7EB";
            error.style.display = "none";
            waveDiv.style.display = "none";
            ayaDiv.style.display = "block";
            kpayDiv.style.display = "none";
            doneButton.disabled = false;
            selectedForm.value = 'ayaForm';
            formToSubmit ='ayaForm';
            console.log(document.getElementById('hidden_payment'));
            
           
          } else {
            ayaPayButton.style.borderColor="#E5E7EB";
            waveDiv.style.display = "none";
            ayaDiv.style.display = "none";
            kpayDiv.style.display = "none";   
            error.style.display = "block";
            doneButton.disabled = true;
            selectedForm.value = 'waveForm'

          }
        });

        //wave
        wavePayButton.addEventListener("click", () => {
        
          
          if (waveDiv.style.display === "none" || waveDiv.style.display === "") {
            wavePayButton.style.borderColor="#7905EE";
            ayaPayButton.style.borderColor="#E5E7EB";
            kbzPayButton.style.borderColor="#E5E7EB";
            error.style.display = "none";
            waveDiv.style.display = "block";
            ayaDiv.style.display = "none";
            kpayDiv.style.display = "none";
            doneButton.disabled = false;
            selectedForm.value = 'waveForm';
            formToSubmit = 'waveForm';
            console.log(document.getElementById('hidden_payment'));
           
          } else {
            wavePayButton.style.borderColor="#E5E7EB";            
            waveDiv.style.display = "none";
            ayaDiv.style.display = "none";
            kpayDiv.style.display = "none";   
            error.style.display = "block";
            doneButton.disabled = true;
            selectedForm.value = 'waveForm'

          }
        });
        
        
        
  	  //drag and drop
        function upload_file(event, dropAreaId) {
            event.preventDefault();
            const file = event.dataTransfer.files[0];
            const fileInputId = dropAreaId.replace('drop_', 'file_');
            handleFile(file, dropAreaId, fileInputId);
           
        }
  	  
       
        function showFileDialog(fileInputId, dropAreaId) {
            const fileInput = document.getElementById(fileInputId);
            if (fileInput) {
                fileInput.click();
            }
        }
   	 
   	 
   	 function showFile(input, dropAreaId) {
            const file = input.files[0];
            handleFile(file, dropAreaId, input.id);
            //uploadToServer(file);
        }
   	 
   	 function handleFile(file, dropAreaId, fileInputId) {
            const fileType = file.type;
            const validExtensions = ["image/jpeg", "image/jpg", "image/png"];
            const dropArea = document.getElementById(dropAreaId);
            const fileInput = document.getElementById(fileInputId);
            const hiddenFile = document.getElementById('hidden_file');  

            if (validExtensions.includes(fileType)) {
                const fileReader = new FileReader();
                fileReader.onload = () => {
                    const fileURL = fileReader.result;
                    const fileName = file.name;

                    console.log("File name:", fileName);
                    console.log("File URL generated:", fileURL);

                    const imgTag = document.createElement("img");
                    imgTag.src = fileURL;
                    imgTag.alt = "Uploaded Image";
                    imgTag.style.maxWidth = "100%";  
                    imgTag.style.maxHeight = "100%"; 
                    
                    
                    dropArea.innerHTML = '';  
                    dropArea.appendChild(imgTag);

                  
                    const dataTransfer = new DataTransfer();
                    dataTransfer.items.add(file);
                    fileInput.files = dataTransfer.files;
                    hiddenFile.files = dataTransfer.files;  
                };
                fileReader.readAsDataURL(file);
            } else {
                alert('Invalid file type. Please select a PNG, JPG, or JPEG file.');
                dropArea.innerHTML = `
                    <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
                    <header>Drag & Drop to Upload Image</header>
                    <span>OR</span>
                    <button type="button" onclick="showFileDialog('${fileInputId}', '${dropAreaId}')">Browse File</button>
                    <input type="file" name="file" id="${fileInputId}" hidden onchange="showFile(this, '${dropAreaId}')">
                `;
            }
        }
        
       
        
       

        

      doneButton.addEventListener("click", () => {
        	if (fileInput1.files.length === 0 && fileInput2.files.length === 0 && fileInput3.files.length === 0) {
                alert("Please upload a screenshot");
                
            }else {
            if (handleDoneButtonClick())
             { 
            	showAlert();
            
            } }
        });
        	
        	
        	
    function handleDoneButtonClick() {
            console.log('fileInput1:', fileInput1);
            console.log('fileInput2:', fileInput2);
            console.log('fileInput3:', fileInput3);
            
            if (!fileInput1 || !fileInput2 || !fileInput3) {
                console.error("File input elements not found.");
                return;
            }
            return true;
            
            
        }
     
    OkButton.addEventListener("click", () => {
    	const fileInput = selectedForm.querySelector('input[type="file"]');
        if (!fileInput.files.length) {
            alert("Please upload a screenshot");
            return;
        } 
       
        document.getElementById('hidden_payment').value = formToSubmit;
        console.log(document.getElementById('hidden_payment'));
     });
   
        
    function showAlert() {   
      document.getElementById('alertBox').classList.toggle('hidden');
      document.getElementById('payment_show').classList.toggle('disabled-background');
    }

    
    function hideAlert() {
      document.getElementById('alertBox').classList.toggle('hidden');
      document.getElementById('payment_show').classList.toggle('disabled-background');
    }
  
	
    </script>

</body>
</html>
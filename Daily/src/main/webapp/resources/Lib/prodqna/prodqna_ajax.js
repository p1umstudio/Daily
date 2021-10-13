/*var objPopup;

function poploginOpen(popmloginpage){
objPopup=window.open(popmloginpage,"loginform", "width=500,height=300,top=500,left=400");
}

function closePopup(){
if(objPopup!= null){
objPopup.close();
	} 
}*/

$(function(){
	$('#pqnaList').click(function(){
		
		
		/*if('loginInfo'!= null){
			
		}else{
			alert('로그인 후 이용하여 주십시오');
			poploginOpen();
			}
		*/
		$.ajax({
			type:'Get',
			url:'pqnaList',
			success:function(resultPage){
				$('#resultArea').html(resultPage);
			},
			error:function(){
				alert('서버 오류 입니다. 잠시후 다시 하여주십시오.');
			}
		});//ajax
	})// list_ click
	
	$('#prodqna_InsertForm').click(function(){
		$.ajax({
			type:'Get',
			url:'pqnaInsertForm',
			success:function(resultPage){
				$('#insertArea').html(resultPage);
			},
			error:function(){
				alert('댓글 등록 오류입니다. 다시 시도하여 주십시오.');
			}
		});//ajax
	})// insertform
	
		
}) //ready 
	
	
	function pqnaInsert(){
		$ajax({
			type:'Get',
			url:'pqnaInsert',
			success:function(resultPage){
				$('#resultArea').html(resultPage);
			},
			error:function(){
				alert('QnA 등록에 실패하셨습니다. 잠시후 다시 하여주십시오.')
			}
		})// ajax 
	}
	
	function pqnaDetail(prodqnanum){
		$.ajax({
			type:'Get',
			url:'pqnaDetail?prodqnanum='+prodqnanum,
			success:function(resultPage){
				$('#resultArea').html(resultPage);
			},
			error:function(){
				alert('서버 오류 입니다. 잠시후 다시 하여주십시오.')
			}
		})//ajax
	}// pqnaDetail
	
	function pqnaupdatef(prodqnanum){
		$.ajax({
			type:'Get',
			url:'pqnaDetail?prodqnanum='+prodqnanum+'&jcode=Update',
			success:function(resultPage){
				$('#resultArea').html(resultPage);
			},
			error:function(){
				alert('댓글수정에 실패 하셨습니다 잠시후 다시하여 주십시오.')
			}
		})// ajax
	}// updateform
	
	function pqnaDelete(id,index){
		$.ajax({
			type:'Get',
			url:'pqnaDelete',
			data:{
				id:id
			},
			success:function(resultData){
				if(resultData.success == 'T'){
					alert('등록된 정보가 삭제 되었습니다.');
					$('#'+index).html('Deleted');
				}	
			}
		})// ajax 
	}
	
	
	
	
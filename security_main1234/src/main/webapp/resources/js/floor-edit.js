$(function() {
	
	
	var tableC_W = 50;
	var tableR_W = 60;
	var tableR_H = 35;
	
	var areaH = $('#floor-div').height();
	var areaW = $('#floor-div').width();
	var actualH = 10;
	var actualW = 10;
	var sizeRatio = actualH/areaH;
	var enableH = actualH/sizeRatio;
	var enableW = actualW/sizeRatio;
	var xPos;
	var yPos;
	var currentDrag;
	
	
	setSize();
	$(window).on('resize', function() {
		setSize();
	});
	
	$('#setSizeBtn').on('click', function() {
		actualH = $('#floor-H').val();
		actualW = $('#floor-W').val();
		
		var floor_no = 1; // 탭 생성, 삭제 기능 추가/ DB에도 floor_name 추가할 것!!
		
		$.ajax({
			url: 'setFloorSize',
			type: 'post',
			data: {
				floorH: actualH,
				floorW: actualW,
				floor_no: floor_no
			},
			success: function() {
				alert('성공');
			},
			error: function(err) {
				alert(err);
			}
			
		});
		
		
		setSize();
	});
	
	function setSize() {
		areaH = $('#floor-div').height();
		areaW = $('#floor-div').width();
		if(areaW/areaH > actualW/actualH) {
			$('#floor-enable').height(areaH);
			$('#floor-enable').width(areaH*(actualW/actualH));
			sizeRatio = actualH/areaH;
		}
		else if(areaW/areaH < actualW/actualH) {
			$('#floor-enable').height(areaW*(actualH/actualW));
			$('#floor-enable').width(areaW);
			sizeRatio = actualW/areaW;
		}
		enableH = actualH/sizeRatio;
		enableW = actualW/sizeRatio;
		
		var t = (areaH-enableH)/2;
		var l = (areaW-enableW)/2;
		// alert(t + ',' + l);
		
		$('#floor-enable').css( 'top', t );
		$('#floor-enable').css( 'left', l);
		
		
		
		setTableIcon();
		
		/*$('html').css( 'overflow', 'hidden' );
		if($(window).width()<800) {
			$('html').css( 'overflow-x', 'visible' );
		}
		if($(window).height()<600) {
			$('html').css( 'overflow-y', 'visible' );
		}*/
	}
	
	
	// $('#floor-enable').css({ top: '0px' });
	
	
	
	
	
	function setTableIcon() {
		$( "#draggable-circle" ).remove();
		$( "#draggable-rect" ).remove();
		
		var html = '' +
			'<div id="draggable-circle">' +
				/*'<div id="rotateable-circle">' +
					'<div id="rotate-circle"></div>' +
				'</div>' +*/
				'<div id="drag-circle"></div>' +
			'</div>';
		
		html += 
		'<div id="draggable-rect">' +
			/*'<div id="rotateable-rect">' +
				'<div id="rotate-rect"></div>' +
			'</div>' +*/
			'<div id="drag-rect"></div>' +
		'</div>';
		
		/*$('#flooricon-div').html($('#flooricon-div').html() + html);*/
		$( '#flooricon-div' ).append(html);
		
		
		$('#draggable-circle').draggable({
			handle: '#drag-circle',
			containment: '#floor-edit',
			drag: function(event) {
				currentDrag = "#draggable-circle";
			}
			
		});
		
		$('#draggable-rect').draggable({
			handle: '#drag-rect',
			containment: '#floor-edit',
			drag: function(event) {
				currentDrag = "#draggable-rect";
			}
		});
		
		
		
		
		
		/*$('#rotateable-circle').draggable({
		  handle: '#rotate-circle',
		  opacity: 0.001,
		  helper: 'clone',
		  drag: function(event) {
		    var // get center of div to rotate
		      pw = document.getElementById('rotateable-circle'),
		      pwBox = pw.getBoundingClientRect(),
		      center_x = (pwBox.left + pwBox.right) / 2,
		      center_y = (pwBox.top + pwBox.bottom) / 2,
		      // get mouse position
		      mouse_x = event.pageX,
		      mouse_y = event.pageY,
		      radians = Math.atan2(mouse_x - center_x, mouse_y - center_y),
		      degree = Math.round((radians * (180 / Math.PI) * -1) + 100);
		
		    var rotateCSS = 'rotate(' + (degree + 170) + 'deg)';
		    $('#rotateable-circle').css({
		      '-moz-transform': rotateCSS,
		      '-webkit-transform': rotateCSS
		    });
		    
		    
		    
		  }
		});*/
		
		
		/*$('#rotateable-rect').draggable({
			  handle: '#rotate-rect',
			  opacity: 0.001,
			  helper: 'clone',
			  drag: function(event) {
			    var // get center of div to rotate
			      pw = document.getElementById('rotateable-rect'),
			      pwBox = pw.getBoundingClientRect(),
			      center_x = (pwBox.left + pwBox.right) / 2,
			      center_y = (pwBox.top + pwBox.bottom) / 2,
			      // get mouse position
			      mouse_x = event.pageX,
			      mouse_y = event.pageY,
			      radians = Math.atan2(mouse_x - center_x, mouse_y - center_y),
			      degree = Math.round((radians * (180 / Math.PI) * -1) + 100);
			
			    var rotateCSS = 'rotate(' + (degree + 170) + 'deg)';
			    $('#rotateable-rect').css({
			      '-moz-transform': rotateCSS,
			      '-webkit-transform': rotateCSS
			    });
			  }
			});*/
		
		$('#draggable-circle').css('top', ($('#flooricon-div').height() - $('#draggable-circle').height())/2);
		$('#draggable-rect').css('top', ($('#flooricon-div').height() - $('#draggable-rect').height())/2);
		
		$('#draggable-circle').css('left', 20);
		$('#draggable-rect').css('left', ($('#flooricon-div').width() - $('#floor-size').width())/4);
		
		
		$('#draggable-circle').width(tableC_W);
		$('#draggable-circle').height(tableC_W);
		$('#draggable-rect').width(tableR_W);
		$('#draggable-rect').height(tableR_H);
		/*$('#rotateable-circle').width('100%');
		$('#rotateable-circle').height('100%');
		$('#rotateable-rect').width('100%');
		$('#rotateable-rect').height('100%');*/
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	$('#floor-enable').droppable({
		drop: function(event) {
			
			
            
            if(currentDrag=="#draggable-circle"||currentDrag=="#draggable-rect") {
            	var offset = $(currentDrag).offset();
            	xPos = offset.left;
            	yPos = offset.top;

            	createTable(currentDrag, xPos, yPos);
            	/*currentDrag = '';*/
			}
            else {
            	
            }
            alert(currentDrag);
            
		}
		
	});
	
	$('#floor-edit').droppable({
		drop: function(event) {
			if(currentDrag=="#draggable-circle"||currentDrag=="#draggable-rect") {
				setTableIcon();				
			}
			else {
				
			}
		}
	});
	
	$('#flooricon-div').droppable({
		drop: function(event) {
			if(!(currentDrag=="#draggable-circle"||currentDrag=="#draggable-rect")) {
				$(currentDrag).remove();
			}
		}
	});
	
	
	
	function createTable(cd, x, y) {
		
		var create_table_no;
		var table_shape;
		if(cd=="#draggable-circle") {
			table_shape = "circle";
		} else if(cd=="#draggable-rect") {
			table_shape = "rect"
		}
		
		$.ajax({
			url: 'createTableLayout',
			type: 'post',
			data: {xPos: x, yPos: y, shape: table_shape},
			dataType: 'json',
			success: function(dat) {

				/*addTableList(dat.no, dat.xPos, dat.yPos, );*/
				
				
				
				
				
				
				

				create_table_no = dat;
				
				var html = '' +
				'<div id="draggable-table' + create_table_no + '">' +
				/*'<div id="rotateable-circle">' +
						'<div id="rotate-circle"></div>' +
					'</div>' +*/
				'<div id="drag-table' + create_table_no + '"></div>' +
				'</div>';
				$( '#floor-edit' ).append(html);
				
				
				$('#draggable-table' + create_table_no).draggable({
					handle: '#drag-table' + create_table_no,
					containment: '#floor-edit',
					drag: function(event) {
						currentDrag = "#draggable-table" + create_table_no;
					}
				
				});
				
				if(cd=="#draggable-circle") {
					table_shape = 'circle';
					$('#draggable-table' + create_table_no).width(tableC_W);
					$('#draggable-table' + create_table_no).height(tableC_W);
					$('#drag-table' + create_table_no).css('border-radius', '50%');
				}
				else if(cd=="#draggable-rect") {
					table_shape = 'rect';
					$('#draggable-table' + create_table_no).width(tableR_W);
					$('#draggable-table' + create_table_no).height(tableR_H);
					$('#drag-table' + create_table_no).css('border-radius', '3%');
				}
				
				
				$('#draggable-table' + create_table_no).css('position', 'absolute');
				$('#draggable-table' + create_table_no).css('top', y);
				$('#draggable-table' + create_table_no).css('left', x);
				
				
				$('#drag-table' + create_table_no).width('100%');
				$('#drag-table' + create_table_no).height('100%');
				$('#drag-table' + create_table_no).css('position', 'absolute');
				$('#drag-table' + create_table_no).css('background-color', '#808080');
				$('#drag-table' + create_table_no).css('border', '1px solid #ff0000');
				
				/*alert(cd + '');*/
				
				
				
				
				
				
				
				
				
				
				
				
			},error: function(err) {
				console.log(err);
			}
			
		});
		
		

		
		
		
		
	}
	
	
	
	
	
	
	
});




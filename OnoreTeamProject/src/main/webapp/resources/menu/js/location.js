					// 지도 띄우기
					var container = document.getElementById('location_map_div2');
					var options = {
					    center: new kakao.maps.LatLng(37.605099, 127.14046), // 위도, 경도
					    level: 3
					};
					var map = new kakao.maps.Map(container, options);
					
					// 위치표시 추가
					var markerPosition  = new kakao.maps.LatLng(37.605099, 127.14046);
					
					var marker = new kakao.maps.Marker({
					    position: markerPosition,
					    map: map,
					    title: 'ONORE', // 매장 이름 추가
					});
					
					marker.setMap(map);
					
					// 마커를 클릭하면 해당 위치로 길찾기 창이 뜨도록 설정
					kakao.maps.event.addListener(marker, 'click', function() {
					    var start = markerPosition;
					    var end = new kakao.maps.LatLng(37.605099, 127.14046); // 목적지 좌표 입력
					    var url = 'https://map.kakao.com/link/to/' + encodeURIComponent('경기도 구리시 동구청로 37') + ',' + end.getLat() + ',' + end.getLng();
					    window.open(url);
					});
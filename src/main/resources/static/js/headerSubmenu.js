let submenuActive = false;

const $submenu = document.querySelector(".submenu");
const $user    = document.querySelector(".user");

document.addEventListener("click", (e) => {
	const clicked = e.target;
	
	// 유저 클릭시 서브메뉴 보여줌
	if (clicked.closest(".user")) {
		e.stopPropagation(); // 이벤트 버블링 방지
		$submenu.style.display = submenuActive ? "none" : "block";
		submenuActive = !submenuActive;
	}
	
	// 서브메뉴 외부 클릭시 서브메뉴 숨김
	if (!clicked.closest(".submenu") && !clicked.closest(".user") && submenuActive) {
		$submenu.style.display = "none";
		submenuActive = false;
	}

})
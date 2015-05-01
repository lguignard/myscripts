function hide_show(user_selec) {
	for(i=0;i<user_selec.options.length;i++) {
		divname=user_selec.options[i].value;
		obj_div = new Array();
		obj_div[i]=document.getElementById(divname);
		obj_div[i].style.display="none";
		if(i==user_selec.options.selectedIndex)
			obj_div[i].style.display="inline";
	}
}

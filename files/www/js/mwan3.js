function resetData() {
	
	var e = [mwan3Str.InterfacesName, mwan3Str.InterfacesEnable, mwan3Str.InterfacesStatus],
	interfacesList = uciOriginal.getAllSectionsOfType("mwan3", "interface"),
	
	t = createTable(e, createInterfaceList(interfacesList, interfacesStatusList), "interfaces_teble", !1, !1),
	n = document.getElementById("interfaces_teble");
	n.firstChild != null && n.removeChild(n.firstChild),
	n.appendChild(t)
}
function sort2dStrArr(e, t) {
	var n = function (e, n) {
		return e[t] == n[t] ? 0 : e[t] < n[t] ? -1 : 1
	};
	e.sort(n)
}

function createInterfaceList(e, s) {
	var t = [],
	i = 0;

	for (i = 0; i < e.length;i++) {
		var enableStatus = uciOriginal.get("mwan3", e[i], "enabled") == "1" ? mwan3Str.Yes : mwan3Str.No;
		var j = 0, Status;
		for(j = 0; j < s.length; j++)
		{
			if(s[i][0] == e[i]) Status = s[i][1];
		}
		
		t.push([e[i], enableStatus, Status])
	}
	
	return sort2dStrArr(t, 1),
	t
}

var mwan3Str = new Object
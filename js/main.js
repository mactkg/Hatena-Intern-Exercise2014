// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(ltsv) {
  var result = ltsv.split('\n').map(
    function(line){
      // return dusts
      if(line == "")
        return null;

      var hash = {};
      var elements = line.split('\t');
      for(var i = 0; i < elements.length; i++) {
        var splited = elements[i].split(':');
        if(splited[0] == "reqtime_microsec")
          splited[1] = Number(splited[1]);
        hash[splited[0]] = splited[1];
      }
      return hash;
  });
 
  // cleaning
  for(var i = 0; i < result.length; i++) {
    if(result[i] == null) {
      result.splice(i);
    }
  }
  return result; 
};

// 課題 JS-2: 関数 `createLogTable` を記述してください
function createLogTable(dom, ltsvs) {
  var table = document.createElement("table");
  
  // make header
  var header = table.createTHead();
  var headerRow = header.insertRow();
  var pathCell = document.createElement("th");
  pathCell.textContent = "path";
  headerRow.appendChild(pathCell);
  var reqtCell = document.createElement("th");
  reqtCell.textContent = "reqtime_microsec";
  headerRow.appendChild(reqtCell);

  // table body
  var tbody = document.createElement("tbody"); 
  for(var i = 0; i < ltsvs.length; i++) {
    var row = tbody.insertRow();
    row.insertCell().textContent = ltsvs[i]["path"];
    row.insertCell().textContent = ltsvs[i]["reqtime_microsec"];
  }

  table.appendChild(tbody);
  dom.appendChild(table);
}

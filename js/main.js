// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(ltsv) {
  var result = ltsv.split('\n').map(
    function(line){
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
  
  for(var i = 0; i < result.length; i++) {
    if(result[i] == null) {
      result.splice(i);
    }
  }
  return result; 
};

// 課題 JS-2: 関数 `createLogTable` を記述してください

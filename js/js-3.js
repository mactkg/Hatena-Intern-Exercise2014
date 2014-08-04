// 課題 JS-3 の実装をここに記述してください。

document.addEventListener("DOMContentLoaded", load, false);

function load() {
  var submitButton = document.getElementById("submit-button");
  submitButton.addEventListener("click", onDataSubmited, false);
};

function onDataSubmited() {
  var data = document.getElementById("log-input").textContent;
  createLogTable(document.getElementById("table-container"), parseLTSVLog(data));
}

import http.requests.*;

void makeRequest() {
  GetRequest get = new GetRequest("http://still-peak-66659.herokuapp.com/entries");
  get.addHeader("Accept", "application/json");
  get.send();
  println("Reponse Content: " + get.getContent());
  println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));
}

void draw() {
}

void mousePressed() {
  makeRequest();
}
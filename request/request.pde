import http.requests.*;

void makeRequest() {
  GetRequest get = new GetRequest("http://localhost:3000/entries");
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
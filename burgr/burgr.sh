java \
  -Dburgr.http.port=8090 \
  -Dburgr.jdbc.url=jdbc:h2:./burgr \
  -Dburgr.hipchat.token=token_to \
  -Dburgr.base.url=http://localhost:8080 \
  -Dburgr.release.url=http://localhost:8080/release \
  -Dburgr.wallboard.url=http://localhost:8080/release/wallboard \
  -Dburgr.github.username=github_username \
  -Dburgr.github.token=github_token \
  -Dburgr.ga.token=some_Google_Analytics_token \
  -jar usr/local/lib/burgr.jar

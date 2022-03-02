![th-1](https://user-images.githubusercontent.com/87088092/155640565-91ed61db-0262-4bc9-8096-51b616c21508.jpg)
# Mod3 Group Consultancy Project

reference: [Turing documentation](https://backend.turing.edu/module3/projects/consultancy)

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
       <ul>
        <li><a href="#inception">Inception</a></li>
      </ul>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
      <ul>
        <li><a href="#database-schema">Database Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#book-club-api">Book Club API</a>
    </li>
    <li><a href="#collaborators">Collaborators</a></li>
  </ol>
</details>

----------

## Getting Started

Book Club Consultancy Project uses Google OAuth2 to register and login a user. In order to login and register with Google OAuth2, you must set up Google OAuth2 and and set the client id for the web application.

  1. Open Google API Console Credentials page https://console.cloud.google.com/apis/credentials?project=services-oauth
  2. Use an existing Google project or create a new project
  3. Select + Create Credentials, then OAuth client ID
  4. It's possible that you may be prompted to set a product name on the Consent screen; if so, click Configure consent screen, supply the requested information, and click Save to return to the Credentials screen.
  5. Select Web Application as the Application type and enter any additional information.
  6. For the Authorized Redirect URIs, make sure the enter the following URLs for local development: http://localhost:3000, then click + ADD URI. This is the default URL when starting Book Club Consultancy Project in development mode.
  7. Click Create
  8. Copy the client id and client secret, and in book_club_FE (config/application.yml) enter both as shown
    ```yaml
    GOOGLE_CLIENT_ID: YOUR_CLIENT_ID
    GOOGLE_CLIENT_SECRET: YOUR_CLIENT_SECRET
    ```
----------

## Project Description

This is a back-end project designed to exercise the fundamental basics of exposing and consuming an API.  Book Club builds community through literature. Users can connect through groups, messaging, and a bountiful resource of books. Functionality is achieved by combining our own database, the Google Books API, and external communication APIs to allow real-time communication, discussions, and recommendations.

----------

## Learning Goals for Project:

Explicit
- Expose an API
- Consume an API
- Use serializers to format JSON responses
- Implement CircleCI
- Implement OAuth2

Implicit
- Project planning
- Reading/Writing documentation
- Time Management/Prioritizing Work
- Breaking down a large project into small pieces
- Breaking down a problem into small steps
- Experience in 'sprints'
- GitHub workflow

----------

### Inception

- Miro Board: [Group Brainstorm](https://miro.com/app/board/uXjVOL7SYZg=/)
  (including mission statement, initial feature dump, initial MVP design, determined stretch features)

- Wireframes: [Wireframes Board](https://miro.com/app/board/uXjVOLawnDs=/)

- Project Board: [User Stories](https://github.com/devin-p-lay/book_club_FE/projects/1)

- User Flow: [Mind Map](https://miro.com/app/board/uXjVOLajDBA=/)

- Group DTR: [DTR responses](https://docs.google.com/document/d/1dr8PcOvEctROQARJs0yk_TheJf21qY06tW8OX3wtlSw/edit)


----------

### Versions

- Ruby 2.7.2
- Rails 5.2.6

----------

### Important Gems

- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails)

- API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993)


----------

## Database Schema

![Screen Shot 2022-02-22 at 10 31 07 AM](https://user-images.githubusercontent.com/87088092/155647400-97e86edd-30ad-4652-b53b-f26fd5ac429d.png)


----------

## APIs

see [book club BE repo](https://github.com/Book-Club-Project/book_club_BE)

----------

## **Contributors** ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <!-- Arnaldo -->
    <td align="center"><a href="https://github.com/arnaldoaparicio"><img src="https://avatars.githubusercontent.com/u/88012780?v=4" width="100px;" alt=""/><br /><sub><b>Arnaldo (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=arnaldoaparicio" title="Code">💻</a> <a href="#ideas-arnaldoaparicio" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=arnaldoaparicio" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3Ajarnaldoaparicio" title="Reviewed Pull Requests">👀</a></td>
    <!-- Eric -->
    <td align="center"><a href="https://github.com/echon006"><img src="https://avatars.githubusercontent.com/u/89038271?v=4" width="100px;" alt=""/><br /><sub><b>Eric (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=echon006" title="Code">💻</a> <a href="#ideas-echon006" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=echon006" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3Ajechon006" title="Reviewed Pull Requests">👀</a></td>
    <!-- Mallory -->
    <td align="center"><a href="https://github.com/Malllll12"><img src="https://user-images.githubusercontent.com/87088092/155652176-cb2263b4-550c-4a80-b38c-519308bd166f.png" width="100px;" alt=""/><br /><sub><b>Mallory (she/her)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=Malllll12" title="Code">💻</a> <a href="#ideas-Malllll12" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=Malllll12" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3AMalllll12" title="Reviewed Pull Requests">👀</a></td>
    <!-- Sierra -->
     <td align="center"><a href="https://github.com/Sierra-T-9598"><img src="https://user-images.githubusercontent.com/87088092/155652453-38a801c4-1243-46ce-a42f-b8416cff0423.png" width="100px;" alt=""/><br /><sub><b>Sierra (she/her)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=Sierra-T-9598" title="Code">💻</a> <a href="#ideas-Sierra-T-9598" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=Sierra-T-9598" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3ASierra-T-9598" title="Reviewed Pull Requests">👀</a></td>
    <!-- Brad -->
     <td align="center"><a href="https://github.com/jbreit88"><img src="https://avatars.githubusercontent.com/u/88853324?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Brad (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=jbreit88" title="Code">💻</a> <a href="#ideas-jbreit88" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=jbreit88" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3Ajbreit88" title="Reviewed Pull Requests">👀</a></td>
    <!-- Devin -->
    <td align="center"><a href="https://github.com/devin-p-lay"><img src="https://avatars.githubusercontent.com/u/87088092?v=4" width="100px;" alt=""/><br /><sub><b>Devin (he/him)</b></sub></a><br /><a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=devin-p-lay" title="Code">💻</a> <a href="#ideas-devin-p-lay" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/Book-Club-Project/book_club_FE/commits?author=devin-p-lay" title="Tests">⚠️</a> <a href="https://github.com/Book-Club-Project/book_club_FE/pulls?q=is%3Apr+reviewed-by%3Ajdevin-p-lay" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--

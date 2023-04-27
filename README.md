<h1 align="center">Time Keep Backend Service</h1>

<br />
<div align="center">
  <a href="https://github.com/Time-Keep/time_keep_be">
    <img src="https://cafefcdn.com/zoom/700_438/2017/tim-hieu-ve-tourbillon-tren-nhung-chiec-dong-ho-tien-ty-tinh-hoa-co-khi-cua-loai-nguoi-1-1498127273369.gif">
  </a>
  <h3 align="center">
    <br />
  </h3>
</div>

# Table of Contents
* [App Description](#app-description)
* [Built With](#built-with)
* [Database Schema](#database-schema)
* [System Requirements](#system-requirements)
* [Technologies Used](#technologies-used)
* [Setup for Ruby on Rails](#setup-for-ruby-on-rails)
* [Respository](#repository)
* [Endpoints](#endpoints)

## Built With

<div align="center">

[![RubyRails][RubyRails]][RubyRails-url] [![RSpec][RSpec]][RSpec-url] [![Atom][Atom]][Atom-url] [![Visual Studio Code][Visual Studio Code]][Visual Studio Code-url]


[![Git Badge][Git Badge]][Git-url] [![PostgreSQL][PostgreSQL]][PostgreSQL-url] [![Postman][Postman]][Postman-url] [![Docker][Docker]][Docker-url] [![GitHub Actions][GitHub Actions]][GitHub Actions-url]

</div>

<p align="right">(<a href="#top">back to top</a>)</p>

## Database Schema


<p align="right">(<a href="#top">back to top</a>)</p>

## Endpoints

Endpoints to use in Postman running a local server `rails s`

### All County Data

```sh
  GET http://localhost:3000/api/v1/county
```

**Sample Response(200)**

```sh
{
    "counties": [
        {
            "state": "Alabama",
            "counties": {
                "county_name": "Autauga",
                "average_wage": "48,347",
                "median_income": "48,347",
                "unemployment": "2.8",
                "annual_avg_establishment_count": 1,
                "combined_tax_rate": "0.28",
                "total_annual_wages": "48,347"
            }
        },
        {
            "state": "Alabama",
            "counties": {
                "county_name": "Baldwin",
                "average_wage": "54,659",
                "median_income": "54,659",
                "unemployment": "3",
                "annual_avg_establishment_count": 0,
                "combined_tax_rate": "0.34",
                "total_annual_wages": "54,659"
            }
        },
        {
            "state": "Alabama",
            "counties": {
                "county_name": "Barbour",
                "average_wage": "40,428",
                "median_income": "40,428",
                "unemployment": "5.7",
                "annual_avg_establishment_count": 0,
                "combined_tax_rate": "0.34",
                "total_annual_wages": "40,428"
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
}
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/103849872?v=4" width='150'></td>
    <td><img src="https://avatars.githubusercontent.com/u/103399143?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104859844?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/81441711?s=150&v=4"></td>
    <td><img src="https://www9.lunapic.com/do-not-link-here-use-hosting-instead/168244291726591690?86239886820"></td>
  </tr>
  <tr>
    <td>Anna Marie Sterling</td>
    <td>Brady Blough</td>
    <td>Eli Fuchsman</td>
    <td>Mary Turpin</td>
    <td>RJ Ekis</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/AMSterling">GitHub</a><br>
      <a href="https://www.linkedin.com/in/sterling-316a6223a/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/bradyblough">GitHub</a><br>
      <a href="https://www.linkedin.com/in/brady-blough-122238211/">LinkedIn</a>
    </td>
    <td>
       <a href="https://github.com/efuchsman">GitHub</a><br>
       <a href="https://www.linkedin.com/in/elifuchsman/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/MaryT573">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mary-turpin-434140150/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Wolf-Prince-Leon">GitHub</a><br>
      <a href="https://www.linkedin.com/in/ryanjekis/">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->

<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Atom]: https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white
[Atom-url]: https://github.com/atom/atom/releases/tag/v1.60.0

[Bootstrap]: https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com/

[Capybara]: https://custom-icon-badges.demolab.com/badge/Capybara-F7F4EF?style=for-the-badge&logo=capybara
[Capybara-url]: https://www.patreon.com/capybara

[CircleCI]: https://img.shields.io/badge/circle%20ci-%23161616.svg?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/developer

[CSS]: https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white
[CSS-url]: https://en.wikipedia.org/wiki/CSS

[Docker]: https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/get-started/

[Fly]: https://custom-icon-badges.demolab.com/badge/Fly-DCDCDC?style=for-the-badge&logo=fly-io
[Fly-url]: https://fly.io/

[Git Badge]: https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white
[Git-url]: https://git-scm.com/

[GitHub Badge]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[GitHub-url]: https://github.com/<Username>/

[GitHub Actions]: https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white
[GitHub Actions-url]: https://github.com/features/actions

[GraphQL]: https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white
[GraphQL-url]: https://graphql.org/

[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/

[Homebrew]: https://custom-icon-badges.demolab.com/badge/Homebrew-2e2a24?style=for-the-badge&logo=homebrew_logo
[Homebrew-url]: https://brew.sh/

[HTML5]: https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white
[HTML5-url]: https://en.wikipedia.org/wiki/HTML5

[JavaScript]: https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E
[JavaScript-url]: https://www.javascript.com/

[jQuery]: https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white
[jQuery-url]: https://github.com/rails/jquery-rails

[LinkedIn Badge]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[LinkedIn-url]: https://www.linkedin.com/in/<Username>/

[MacOS]: https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0
[MacOS-url]: https://www.apple.com/macos

[Miro]: https://img.shields.io/badge/Miro-050038?style=for-the-badge&logo=Miro&logoColor=white
[Miro-url]: https://miro.com/

[Postgres]: https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/

[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[Postman]: https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white
[Postman-url]: https://web.postman.co/

[Rails]: https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/

[Redis]: https://img.shields.io/badge/redis-%23DD0031.svg?&style=for-the-badge&logo=redis&logoColor=white
[Redis-url]: https://redis.io/

[Replit]: https://img.shields.io/badge/replit-667881?style=for-the-badge&logo=replit&logoColor=white
[Replit-url]: https://replit.com/

[RSpec]: https://custom-icon-badges.demolab.com/badge/RSpec-fffcf7?style=for-the-badge&logo=rspec
[RSpec-url]: https://rspec.info/

[RuboCop]: https://img.shields.io/badge/RuboCop-000?logo=rubocop&logoColor=fff&style=for-the-badge
[RuboCop-url]: https://docs.rubocop.org/rubocop-rails/index.html

[Ruby]: https://img.shields.io/badge/Ruby-000000?style=for-the-badge&logo=ruby&logoColor=CC342D
[Ruby-url]: https://www.ruby-lang.org/en/

[RubyRails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[RubyRails-url]: https://rubyonrails.org/

[Slack]: https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white
[Slack-url]: https://slack.com/trials?remote_promo=f4d95f0b&utm_medium=ppc&utm_source=google&utm_campaign=ppc_google_amer_en_brand_selfserve_discount&utm_term=Slack_Exact_._slack_._e_._c&utm_content=611662283461&gclid=Cj0KCQiA54KfBhCKARIsAJzSrdptOf7OUrgfeH0CWCC7LaOjR8arXoBnBMZjUSTJqmzTKvH6Jh-YXzAaAjfWEALw_wcB&gclsrc=aw.ds

[Tailwind]: https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white
[Tailwind-url]: https://tailwindcss.com/

[Visual Studio Code]: https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white
[Visual Studio Code-url]: https://code.visualstudio.com/

[XCode]: https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white
[XCode-url]: https://developer.apple.com/xcode/

[Zoom]: https://img.shields.io/badge/Zoom-2D8CFF?style=for-the-badge&logo=zoom&logoColor=white
[Zoom-url]: https://zoom.us/

[bcrypt-docs]: https://github.com/bcrypt-ruby/bcrypt-ruby
[capybara-docs]: https://github.com/teamcapybara/capybara
[factory_bot_rails-docs]: https://github.com/thoughtbot/factory_bot_rails
[faker-docs]: https://github.com/faker-ruby/faker
[faraday-docs]: https://lostisland.github.io/faraday/
[figaro-docs]: https://github.com/laserlemon/figaro
[jsonapi-serializer-docs]: https://github.com/jsonapi-serializer/jsonapi-serializer
[launchy-docs]: https://www.rubydoc.info/gems/launchy/2.2.0
[omniauth-google-oauth2-docs]: https://github.com/zquestz/omniauth-google-oauth2
[orderly-docs]: https://github.com/jmondo/orderly
[pry-docs]: https://github.com/pry/pry
[rspec-rails-docs]: https://github.com/rspec/rspec-rails
[shoulda-matchers-docs]: https://github.com/thoughtbot/shoulda-matchers
[simplecov-docs]: https://github.com/simplecov-ruby/simplecov
[vcr-docs]: https://github.com/vcr/vcr
[webmock-docs]: https://github.com/bblimke/webmock

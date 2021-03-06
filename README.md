## 프로젝트: calendar-dev
본 프로젝트는 한국기술교육대학교 컴퓨터공학부 4학년 "웹서비스컴퓨팅및실습" 수업에서 Assignment로 활용하는 프로젝트입니다. 

### Assignment 5 (Term Project)
#### 제목: Web 기반 myCalendar 어플리케이션 구축하기
#### 기한: 2014년 12월 14일 (일요일) 23시 59분 
- 요구 사항 1 - 홈에 작성되어 있 기본 요구 기능 모두 구현하기
- 요구 사항 2 - 다음의 추가 기능 사항들에 구현하기 (선택사항)
  - 나의 정보 수정
  - (이미 생성되어 있는) 이벤트 정보 수정
  - 이벤트가 기록되어 있는 달력 출력 기능
  - 회원 가입 및 이벤트 생성에 form validation 기능 추가 
- 전반적인 요구 사항
  - bootstrap 및 다른 css/jquey등을 이용하여 화면을 최대한 세련되게 꾸며볼 것
  
### Assignment 4
#### 제목: Calendar-dev를 Web 기반 어플리케이션으로 전환하기
#### 기한: 2014년 11월 21일 (금요일) 23시 59분 
- 기존의 calendar-dev를 완전히 삭제하고 다시 import 하기
  - STS에서 calendar-dev 프로젝트 삭제 (disk에서도 삭제 - Delete project contents on disk 체크)
  - Source Tree에서 calendar-dev를 삭제하고 github URL 재 확인 후 다시 clone 하여 로컬에 가져오기
  - STS에서 로컬에 있는 프로젝트를 import 하여 프로젝트를 새로 만들기
- 요구 사항 1 - github에 새로운 Web 기반 프로젝트를 만들고 calendar-dev 코드를 모두 심기
  - 1) 가장 먼저 할 일: github에 새로운 Repository 생성
  - 2) Web 기반 프로젝트 생성
    - 수업시간에 배운 그대로 따라서 생성
      - 프로젝트 이름: calendar
      - 패키지 이름: com.mycompany.calendar
    - 참고 사이트 - http://www.codejava.net/frameworks/spring/spring-mvc-beginner-tutorial-with-spring-tool-suite-ide
  - 3) 로컬 폴더에 있는 내용을 Source Tree에 추가하고 Commit 이후 github에 Push
    - 로컬 폴더를 Source Tree에 추가한 후 설정에 들어가 1)에서 생성한 github URL을 등록해 줄 필요 있음  
  - 4) calendar-dev에 있는 다음 사항들을 차례대로 넣고 테스트하기 (각종 xml 구성에 신경쓰면서 작업)  
    - domain
    - dao
      - DaoJUnitTest.java의 JUnit 테스트를 수행하여 모든 테스트 통과해야 함
    - service
      - CalendarServiceTest.java의 JUnit 테스트를 수행하여 모든 테스트 통과해야 함
- 요구 사항 2 - CalendarService 제작과 이벤트 레벨 관리 및 트랜잭션 테스트 하기
  - HomeController.java의 home() 메소드 마지막 부분에 "model에 calendarUsers, events, eventAttentees 배열 객체 추가" 요구사항 구현
  - home.jsp 를 적절한 폴더에 생성하여 내용 구현
  - 브라우저 화면 내에 calendarUsers, events, eventAttentees 배열 내 각 객체들의 모든 속성 내용을 자세히 출력
  - 화면을 최대한 세련되게 꾸며볼 것
  
### Assignment 3
#### 제목: Domain 객체 및 Dao 객체 재정리 및 CalendarService 제작과 이벤트 레벨 관리 및 트랜잭션 테스트 하기
#### 기한: 2014년 10월 26일 (일요일) 23시 59분 
- calendar-dev를 pull 하여 최신 버전으로 업데이트하기
- 요구 사항 1 - Domain 객체 및 Dao 객체 재정리
  - 변경된 스키마 학습 및 DB에 반영
    - src/main/resources/database/calendar-schema.sql
  - 추가된 다음 클래스/이늄 학습 
    - EventAttendee.java
    - EventLevel.java
  - 변경된 다음 클래스 학습
    - Event.java
  - [코딩 요구 사항 1-1] JdbcEventAttendeeDao.java에 있는 //TODO Assignment 3 구현 (총 6 개)
  - [코딩 요구 사항 1-2] JdbcEventDao.java에 있는 //TODO Assignment 3 구현 (총 2 개)
  - [코딩 요구 사항 1-3] DaoJUnitTest.java에 있는 //TODO Assignment 3 구현 (총 1 개)
  - [주의 1-1] Event 클래스에서 Attendee는 별도의 클래스 EventAttendee에서 정의 
  - [주의 1-2] Event의 레벨 관리 부분 주목
- 요구 사항 2 - CalendarService 제작과 이벤트 레벨 관리 및 트랜잭션 테스트 하기
  - [코딩 요구 사항 2-1] DefaultCalendarService.java에 있는 //TODO Assignment 3 구현 (총 17 개)
  - [주의 2-1] 이벤트 레벨 관리는 교재에서 학습한 것과 로직이 거의 동일함
    - 요구 사항: 각 이벤트들은 처음에 NORMAL 레벨이지만 주기적으로 numLike가 10이상인지에 대한 조건을 확인하여 조건이 맞다면 HOT 레벨로 업그레이드 한다. 
  - [주의 2-2] CalendarServiceTest.java는 완벽하게 코딩이 되어 있음. 이곳에 존재하는 테스트를 완벽하게 성공시켜야 함
  - [주의 2-3] 5.2.4절에서 학습한 트랜잭션 관련 코드를 upgradeEventLevels() 메소드에 넣어 주어야 함
  
  
### Assignment 2
#### 제목: Dao를 JdbcTemplate를 활용하여 작성하고 JUnit 프레임워크로 테스트 하기
#### 기한: 2014년 10월 04일 (토요일) 23시 59분 
- calendar-dev를 pull 하여 최신 버전으로 업데이트하기
- calendar-dev 오른쪽 클릭 > Maven > Update Project 실행하여 라이브러리 재정리하기
  - [참고] 새로 추가된 Maven 라이브러리
    - spring-test
    - junit
- 요구 사항 1 - 다음 두 개의 Dao 클래스를 JdbcTemplate를 활용하여 리펙토링하기
  - JdbcCalendarUserDao.java
  - JdbcEventDao.java
  - [주의 1] 각 클래스 마다 deleteAll() 메소드가 추가되었고 구현 필요
  - [주의 2] EventDao 및 JdbcEventDao에 있던 이전 findForUser(int userId)는 findForOwner(int ownerUserId)로 메소드 이름과 인자 이름이 변경되었음, 역시 구현 필요
- 요구 사항 2 - 다음 테스트 클래스 구현하기 
  - 주석으로 설명해 놓은 7가지 사항 코딩하기 
  - [주의 1] @Before 1개 + @Test 6개
  - [주의 2] 테스트는 모두 성공해야 함
  - [주의 3] 비교 테스트시에는 반드시 JUnit 테스트 방법을 활용한다.
  

### Assignment 1
#### 제목: Dao를 이전 스타일로 작성하여 테스트 하기
#### 기한: 2014년 9월 17일 (수요일) 23시 59분 
- 본 프로젝트를 각자 자신의 github 내로 fork 하여 가져가기
- 자신의 로컬 하드로 프로젝트 내려받기 
- STS에서 해당 프로젝트를 import 하기 (Exsiting Maven Project)
- 로컬에 설치된 MySQL에 DB 구축하기
  - MySQL 서버 및 MySQL Workbench 실행
  - calendar-dev/src/main/resources/database/calendar-schema.sql 파일 내용을 MySQL Workbech에서 실행하기
  - 사용자는 반드시 ID: spring, PW: book으로 추가
- 다음의 DAO 파일 구현하기
  - JdbcCalendarUserDao.java
  - JdbcEventDao.java
- DaoTest.java 파일 구현하기
  - 주석으로 설명해 놓은 8가지 사항 코딩하기
  - 실행 모습 캡쳐
- 보고서 작성 및 제출
  - 프로그램 내에 작성한 특정한 부분 코드에 대한 설명을 코드와 함께 적을 것
  - 프로그램 수행 화면을 캡쳐하여 넣을 것
  - 작성 방법
    - 보고서 파일(HWP 또는 MS-Word) 작성
    - 표지, 서론, 본론, 결론의 구조를 가진 보고서
    - 서론: Homework의 내용 및 목적
    - 본론: 각각의 문제를 코딩한 이후 앞에 있는 요구사항에 따라 작성
    - 결론: 숙제를 한 이후의 느낀점, 하고싶은 말, 또는 불평~~
  - 과제를 제출 할 곳: http://el.koreatech.ac.kr 
  - 파일명: 웹서비스컴퓨팅및실습-1차-홍길동-2010111222.hwp
  - 게시물 제목 및 내용: 웹서비스컴퓨팅및실습-1차-홍길동-2010111222
    - 반드시 내용에 본인 코드가 올려져 있는 github repository url을 기재할 것
  - 질문은 jyjin989@koreatech.ac.kr로 메일을 보내면서 yhhan@koreatech.ac.kr를 CC 할 것



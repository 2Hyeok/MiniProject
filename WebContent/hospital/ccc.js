let date = new Date();

const renderCalendar = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();


//  month 는 0부터 시작이라 1 더함 
document.querySelector('.year-month').textContent =`${viewYear}년 ${viewMonth + 1}월`;


//파라미터 date에 해당하는 부분에 0을 전달하게 되면,
 //지난달의 마지막 날의 Date 객체가 생성
const prevLast = new Date(viewYear, viewMonth, 0);
const thisLast = new Date(viewYear, viewMonth + 1, 0);


//지난달 마지막 날짜(PLDate)와 요일(PLDay), 
//그리고 이번 달 마지막 날짜(TLDate)와 요일(TLDay)

const PLDate = prevLast.getDate();
const PLDay = prevLast.getDay();

const TLDate = thisLast.getDate();
const TLDay = thisLast.getDay();


/*이렇게 날짜들은 담아둘 배열을 만듬
지난 달 날짜와 다음 달 날짜는 상황에 따라 그릴 수도, 
그리지 않을 수도 있기 때문에 일단 초기값은 빈 배열로 두고,
이번 달 날짜는 조금 독특한 방식으로 배열을 생성했는데, 
천천히 살펴보면 원리는 다음과 같습니다.

1. Array(n)으로 배열을 만들면 길이가 n인 배열이 
 생성됩니다. (이때 모든 요소들은 undefined)

2. 그런데 모든 요소들이 empty 값이기 때문에 
    keys() 메서드를 활용하면 0부터 n - 1까지의 Array Iterator가 생성

3. 전개 구문을 통해서 이 Array Iterator를 배열로 만들어 내면 0부터 n-1까지의 배열을 얻어낼 수가 있습니다.

4. 그래서 이번 달 마지막 날짜 + 1을 n에 전달해주고

5. 제일 앞에 있는 0을 없애기 위해서 slice 메서드를 활용한 것 */
const prevDates = [];
const thisDates = [...Array(TLDate + 1).keys()].slice(1);
const nextDates = [];




/*
첫 번째는 이전 달을 표현할 날짜들을 생성하는데, 
만약 지난달 마지막 요일이 토요일(6)이라면 
굳이 그릴 필요 없으니깐 조건문을 먼저 달아줬습니다. 
그러고 나서 반복문의 조건 부분은 
0부터 시작해서 지난달 마지막 요일이 될 때까지 반복하게 작성했고. 
지난달의 마지막 날짜부터  
1씩 줄어든 값을 unshift 메서드를 통해 
prevDates 배열에 앞쪽으로 계속 채워 넣는 방식입니다.

 
두 번째는 다음 달을 표현할 날짜들인데 생각보다 간단하게 
이번 달 마지막 날짜의 요일을 기준으로 필요한 개수를 파악해서 
1부터 1씩 증가시키며 nextDates 배열에 하나씩 채워 넣는 방식 
if (PLDay !== 6) {
    for (let i = 0; i < PLDay + 1; i++) {
      prevDates.unshift(PLDate - i);
    }
  }
  
for (let i = 1; i < 7 - TLDay; i++) {
    nextDates.push(i);
}
*/


/*
concat 메서드를 통해서 세 배열을 합친 다음에, 
forEach 메서드로 전체 요소들을 돌면서, 
html 코드로 데이터를 하나씩 수정해 줍니다.

그러고 나서 .dates 태그의 innerHTML 프로퍼티에다가, 
dates 배열에 join 메서드를 호출한 결과를 할당
*/
const dates = prevDates.concat(thisDates, nextDates);

dates.forEach((date, i) => {
  dates[i] = `<li class="date" style="margin-top:10px;">${date}</li>`;
})

document.querySelector('.dates').innerHTML = dates.join('');
}
renderCalendar();


const prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
  }
  
  const nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
  }
  
  const goToday = () => {
    date = new Date();
    renderCalendar();
  }
/*
   // 오늘 날짜 그리기
   const today = new Date();
   if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
     for (let date of document.querySelectorAll('.this')) {
       if (+date.innerText === today.getDate()) {
         date.classList.add('today');
         break;
       }
     }
   }
*/

//————time table——————

  var dates = document.getElementsByClassName("date");

  function handleClick(event) {
    console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다

    console.log(event.target.classList);

    if (event.target.classList[1] === "clicked") {
      event.target.classList.remove("clicked");
    } else {
      for (var i = 0; i < dates.length; i++) {
        dates[i].classList.remove("clicked");
      }

      event.target.classList.add("clicked");
    }
  }

  function init() {
    for (var i = 0; i < dates.length; i++) {
      dates[i].addEventListener("click", handleClick);
    }
  }
  init();
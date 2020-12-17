<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto+Slab);
div#chat_container{
    position: absolute;
    bottom: 0;
    right: 10px;
    width: 270px;
    height: 310px;
    overflow: hidden;
    z-index: 1000;
    /*top:300px;*/
}
div#chat{
    position: absolute;
    bottom: 0;
    right: 10px;
    width: 250px;
    height: 300px;
    background-color: #efefef;
    box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.25);
    transition:transform 300ms;
}

div#chat.active{transform: translateY(271px);}
div#chat header{
    width: 100%;
    height: auto;
    background-color: #FDCE6E;
    cursor: pointer;
}
div#chat header h1{
    font-family: 'Roboto Slab', sans-serif;
    color: white;
    font-size: 16px;
    text-align: left;
    whidth: 100%;
    margin: 0;
    padding: 3px 0 3px 20px;
}
div#chat section.content{
    overflow:scroll;
    background-color: #ffe1e1;
    position:absolute;
    top:29px;
    left: 0;
    right: 0;
    bottom:0;
}
div#chat form{
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 40px;
    background-color: white;
}
div#chat form input{
    display: block;
    width: 90%;
    height: 30px;
    border: none;
    line-height: 30px;
    margin: 5px auto;
    border-botom: 1px solid #303030;
    background-color: white;
    font-size: 16px;
}
div#chat form a{}

/* Experience digital logo */
#Provided_by{
    position:fixed;
    bottom: 20px;
    left:70px;
    color: #424242;
    text-decoration: none;
    font-family: sans-serif;
    margin-top: -20px;
    font-weight: 200;
}
#Provided_by img{
    position: absolute;
    bottom: -8px;
    width: 40px;
    left: -50px;
}
</style>
</head>
<body>
  <script language = "text/javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>
 <div id="chat_root"></div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.14.0/react-dom.js"></script>
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/react/16.13.1/umd/react.production.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/16.13.1/umd/react-dom.production.min.js"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
  <script src="https://unpkg.com/socket.io-client@2.3.0/dist/socket.io.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/babel">
	const socket=io.connect('http://localhost:3355')
    class App extends React.Component{
       constructor(props)
       {
           super(props);
           // 채팅문자를 저장하는 변수 
		   this.state={
				logs:[]
		   }
       }
       componentDidMount() //$(function(){
       {
		   // 서버에 전송된 채팅문자열을 logs에 저장 => render에서 출력
		   socket.on('chat-msg',(obj)=>{
				const log2=this.state.logs;
				log2.push(obj)
				this.setState({logs:log2})
		   })
           $('div#chat').toggleClass('active');
           var $win = $(window);
           var top = $(window).scrollTop(); // 현재 스크롤바의위치값을 반환합니다.
           /*사용자 설정 값 시작*/
           var speed          = 1000;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
           var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
           var $layer         = $('div#chat_container'); // 레이어셀렉팅
           var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
           $layer.css('position', 'absolute');
           /*사용자 설정 값 끝*/
           // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
           if (top > 0 )
             $win.scrollTop(layerTopOffset+top);
           else
             $win.scrollTop(0);
           //스크롤이벤트가 발생하면
             $(window).scroll(function(){
             var yPosition = $win.scrollTop()+300;
             if (yPosition< 0)
             {
               yPosition = $win.scrollTop()+300;
             }
             $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
           });
        }
        render(){
           return (
              <ChatMain logs={this.state.logs}/>
           )
        }
    }
    class ChatMain extends React.Component{
        render(){
		  const html=this.props.logs.map((m)=>
				<div className="message-right">
					<div className="message-text">{m.message}</div>
				</div>
		  )
          return(
           <div id="chat_container">
             <div id="chat" className="active">
              <div id="chat_title"><header><h1 id="chat_font">Chat</h1></header></div>
              <section className="content">
               <div className="message-content">
                  {html}
               </div>
              </section>
              <ChatForm/>
             </div>
           </div>
           )
        }
    }
    class ChatForm extends React.Component{
		constructor(props) {
			super(props)
			this.state={
			   message:''
			}
		}
		messageChange(e) {
			this.setState({message:e.target.value})
		}
		send(e) {
			if(e.key=='Enter') {
				e.preventDefault();
				socket.emit('chat-msg',{
					message:this.state.message
				})
				this.setState({message:''})
			}
		}
        render(){
            return (
               <form>
                <input id="input_chat" type="text"
				 onChange={this.messageChange.bind(this)}	
				 onKeyPress={this.send.bind(this)}
				 value={this.state.message}
				/>
               </form>
            )
        }
    }
    ReactDOM.render(<App/>,document.getElementById('chat_root'))
  </script>
</body>
</html>
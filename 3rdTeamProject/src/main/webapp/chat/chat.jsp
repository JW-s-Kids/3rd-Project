<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/chat.css">
</head>
<body>
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
		   /*
           var speed          = 1000;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
           var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
           var $layer         = $('div#chat_container'); // 레이어셀렉팅
           var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
           $layer.css('position', 'absolute');
			*/
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
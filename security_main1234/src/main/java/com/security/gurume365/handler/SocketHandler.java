package com.security.gurume365.handler;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
    private final Logger logger = LogManager.getLogger(getClass());
    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
    public SocketHandler (){
          super();
          this.logger.info("create SocketHandler instance!");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session,
                 CloseStatus status) throws Exception {
          super.afterConnectionClosed(session, status);

          sessionSet.remove(session);

          this.logger.info("세션 삭제!");
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session)
                 throws Exception {
          super.afterConnectionEstablished(session);
          sessionSet.add(session);
          this.logger.info("세션 추가!");
    }

    @Override
    public void handleMessage(WebSocketSession session,
                 WebSocketMessage<?> message) throws Exception {
          super.handleMessage(session, message);
         
          this.logger.info("받은 메세지:"+message.toString());
    }

    @Override
    public void handleTransportError(WebSocketSession session,
                 Throwable exception) throws Exception {
          this.logger.error("웹 소켓 에러 발생", exception);
    }

    @Override
    public boolean supportsPartialMessages() {
          this.logger.info("메소드 호출");
          
          return super.supportsPartialMessages();
    }

    @Override

    public void afterPropertiesSet() throws Exception {
          Thread thread = new Thread(){
                 @Override
                 public void run() {
                        while (true){
                              try {
                                     sendMessage ("이게뭐냐");
                                     Thread.sleep(1000);
                              } catch (InterruptedException e) {
                                     e.printStackTrace();
                                     break;
                              }
                        }
                 }
          };
          thread.start();
    }
    
    public void sendMessage (String message){
        for (WebSocketSession session: this.sessionSet){
               if (session.isOpen()){
                      try{
                    	  	logger.info("언제실행?"+message);
                            session.sendMessage(new TextMessage(message));
                      }catch (Exception ignored){
                            this.logger.error("메세지 전송에 실패했습니다", ignored);
                      }
               }
        }
  }

}
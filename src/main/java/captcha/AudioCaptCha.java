package captcha;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;

public class AudioCaptCha {
	public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse res, String answer) throws IOException{
		HttpSession session = req.getSession();
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		String getAnswer = answer;
		if(getAnswer == null || getAnswer.equals("")) getAnswer = captcha.getAnswer();
		
		AudioCaptcha audiocaptcha = new AudioCaptcha.Builder()
				.addAnswer(new SetTextProducer(getAnswer))
				.addNoise()
				.build();
		
		CaptchaServletUtil.writeAudio(res, audiocaptcha.getChallenge());
	}
}

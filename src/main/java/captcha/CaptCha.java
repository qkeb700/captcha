package captcha;
import java.io.IOException;
import java.util.ArrayList;
import java.awt.Color;
import java.awt.Font;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import static nl.captcha.Captcha.NAME;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;

public class CaptCha {
	private static final long serialVersionUID = 1L;
	private static int width = 150;
	private static int height = 50;
	
	public void getCaptCha(HttpServletRequest req, HttpServletResponse res) throws IOException{
		// 폰트 설정
		List<Font> fontList = new ArrayList<Font>();
		fontList.add(new Font("", Font.HANGING_BASELINE, 40));
		fontList.add(new Font("Courier", Font.ITALIC,40));
		fontList.add(new Font("", Font.PLAIN, 40));
		List<Color> colorList = new ArrayList<Color>();
		colorList.add(Color.green);
		
		Captcha captcha = new Captcha.Builder(width, height)
				.addText(new NumbersAnswerProducer(6), new DefaultWordRenderer(colorList, fontList))
				.gimp(new DropShadowGimpyRenderer()).gimp()
				.addNoise().addBorder()
				.addBackground(new GradiatedBackgroundProducer())
				.build();
		
		req.getSession().setAttribute(NAME, captcha);
		CaptchaServletUtil.writeImage(res, captcha.getImage());
	}
}

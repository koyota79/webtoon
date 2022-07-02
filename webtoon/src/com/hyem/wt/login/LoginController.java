package com.hyem.wt.login;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.VO.LoginVO;
import com.hyem.wt.login.service.LoginService;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService service;

	@RequestMapping("/login")
	public String LoginChk(Model model, HttpServletRequest request,
			HttpServletResponse respose) {
		ModelAndView mav = new ModelAndView();

		return "loginPage";
	}

	@RequestMapping("/loginAppProc")
	public ModelAndView LoginAppProc(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		// �����Ϳ� �並 ���ÿ� ������ ����
		ModelAndView mv = new ModelAndView("jsonView");
		// mv.setViewName("/board/content"); // ���� �̸�

		HashMap hmap = new HashMap<String, Object>();
		String v_userId = "";
		String v_password = "";
		String v_retMsg = "";
		String v_retCode = "";
		JSONObject jObject = new JSONObject();
		try {
			// ������ �����´�. (������ ������ ���ٸ� �����Ѵ�.)
			HttpSession httpSession = request.getSession(true);
			HashMap sessionMap = (HashMap) httpSession.getAttribute("SESSION");

			if (sessionMap != null) {
				// ������ login�̶� ���� ���� �����Ѵٸ�
				httpSession.removeAttribute("SESSION"); // �������� ������ �ش�.
			}

			v_userId = request.getParameter("user_id");
			v_password = request.getParameter("password");
			System.out.println(":::::::v_userId:::::" + v_userId);
			System.out.println("::::::password::::::" + v_password);
			hmap.put("user_id", v_userId);
			hmap.put("password", v_password);

			HashMap result = service.selectLoginChk("selectLoginChk", hmap);

			// System.out.println("::::::::::::"+result.get("user_id"));
			// Logger logger =
			// Logger.getLogger("::::::::::::"+result.get("user_id"));

			if (result != null) {

				v_retMsg = "�α��ο� �����Ͽ����ϴ�.";
				v_retCode = "00";

				if (!result.get("password").equals(v_password)) {
					v_retMsg = "�н����尡 Ʋ�Ƚ��ϴ�.";
					v_retCode = "02";
				}

			} else {
				v_retMsg = "���̵� ���� ���� �ʽ��ϴ�.";
				v_retCode = "01";
			}

			// jObject.put("retMsg", v_retMsg);
			// jObject.put("retCode", v_retCode);
			mv.addObject("retMsg", v_retMsg); // ��� ���� ������ ��
			mv.addObject("retCode", v_retCode); // ��� ���� ������ ��
			// "USER"�� sessionVO�� ���ǿ� ���ε��Ѵ�.
			httpSession.setAttribute("SESSION", result);

		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			/*
			 * jObject.put("retMsg", "�α��� ���ܻ��׿���"); jObject.put("retCode",
			 * "99");
			 */
			mv.addObject("retMsg", "�α��� ���ܻ��׿���"); // ��� ���� ������ ��
			mv.addObject("retCode", "99"); // ��� ���� ������ ��
		} finally {
			try {
				/*
				 * response.setContentType("text/plain;charset=UTF-8");
				 * PrintWriter out = response.getWriter(); out.print(jObject);
				 * out.flush(); out.close();
				 */
			} catch (Exception ex) {
			}
		}

		mv.setViewName("/mainPage");
		return mv;
	}

	@RequestMapping(value="/loginProc.json" , method = { RequestMethod.POST})
	@ResponseBody
	public ModelAndView LoginProc(@RequestParam HashMap<String, Object> param,
			HttpServletRequest request, HttpServletResponse response) {
		// �����Ϳ� �並 ���ÿ� ������ ����
		ModelAndView mv = new ModelAndView("jsonView");
		HashMap hmap = new HashMap<String, Object>();
		String v_userId 	= "";
		String v_password 	= "";
		String v_retMsg 	= "";
		String v_retCode 	= "";
		HashMap retMap 		= new HashMap<String, Object>();
		try {
			// ������ �����´�. (������ ������ ���ٸ� �����Ѵ�.)
			HttpSession httpSession = request.getSession(true);
/*			HashMap sessionMap = (HashMap)httpSession.getAttribute("SESSION");

			if (sessionMap != null) {
				// ������ login�̶� ���� ���� �����Ѵٸ�
				httpSession.removeAttribute("SESSION"); // �������� ������ �ش�.
			}
*/
			v_userId = request.getParameter("login_id");
			v_password = request.getParameter("password");

			System.out.println(":::::::v_userId:::::" + v_userId);
			System.out.println("::::::password::::::" + v_password);
			hmap.put("login_id", v_userId);
			hmap.put("password", v_password);

			// HashMap result = service.selectLoginChk("selectLoginChk" , hmap);
			LoginVO loginInfo = service.selectLoginChkVO("selectLoginChkVO",param);
			// System.out.println("::::::::::::"+result.get("user_id"));
			// Logger logger =
			// Logger.getLogger("::::::::::::"+result.get("user_id"));

			// if(result != null){
			System.out.println(":::::::password" + loginInfo.getPassword());
			String login_id = loginInfo.getLogin_id();
			if (!login_id.equals("")) {
				v_retMsg = "�α��ο� �����Ͽ����ϴ�.";
				v_retCode = "00";

				/*
				 * if(!result.get("password").equals(v_password)){ v_retMsg =
				 * "�н����尡 Ʋ�Ƚ��ϴ�."; v_retCode = "02"; }
				 */

			} else {
				v_retMsg = "���̵� ���� ���� �ʽ��ϴ�.";
				v_retCode = "01";
			}

			retMap.put("retMsg", v_retMsg);
			retMap.put("retCode", v_retCode);
			// "USER"�� sessionVO�� ���ǿ� ���ε��Ѵ�.
			httpSession.setAttribute("SESSION", loginInfo);

		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			retMap.put("retMsg", "�α��� ���ܻ��׿���");
			retMap.put("retCode", "99");
		} finally {
			/*
			 * try{ response.setContentType("text/plain;charset=UTF-8");
			 * PrintWriter out = response.getWriter(); out.print(jObject); //
			 * out.println("<script>alert('�α��� ������ Ȯ�����ּ���.');</script>");
			 * out.flush(); out.close(); }catch(Exception ex){}
			 */
		}
		mv.addObject("DATA", retMap);
	    //mv.setViewName("/mainPage");
		return mv;
	}

	@RequestMapping("/loginOut")
	public ModelAndView LoginOut(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		HttpSession httpSession = request.getSession(false);
		httpSession.invalidate();
		mv.setViewName("/mainPage");
		return mv;
	}

	@RequestMapping("/getUserInfo")
	public void UserSession(@RequestParam HashMap<String, Object> params,
			HttpServletRequest request, HttpServletResponse response) {
		JSONObject jObject = new JSONObject();

		try {
			if (params != null) {
				String v_action = (String) params.get("MAIN_ACTION");
				// jObject.put("SESSION_KEY", "");

				if (v_action.equals("INSERT")) {

					int result = service.insertLoginTempInfo(
							"insertLoginTempInfo", params);

					System.out.println("::::result:::::" + result);

					if (result > 0) {
						jObject.put("user_id", (String) params.get("USER_ID"));
					}
				}

				jObject.put("retCode", "00");
			} else {

				jObject.put("retCode", "01");
			}
			System.out.println(":::jObject.toString():::"+jObject.toString());
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(jObject.toString());
			out.flush();
			out.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}

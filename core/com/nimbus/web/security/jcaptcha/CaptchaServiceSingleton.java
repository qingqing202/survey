package com.nimbus.web.security.jcaptcha;

import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;
import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;
import com.octo.captcha.service.image.ImageCaptchaService;

public class CaptchaServiceSingleton {
  public static ImageCaptchaService getInstance() {
    return instance_;
  }

  private static ImageCaptchaService instance_ = 
      new DefaultManageableImageCaptchaService();

  static {
    instance_ = new DefaultManageableImageCaptchaService(
        new FastHashMapCaptchaStore(), new CaptchaEngine(), 180, 100000, 75000);
  }
}
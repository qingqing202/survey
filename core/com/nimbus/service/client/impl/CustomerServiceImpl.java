package com.nimbus.service.client.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.orm.hibernate.Page;

import com.nimbus.dao.PagerHibernateTemplate;
import com.nimbus.entity.client.Customer;
import com.nimbus.service.client.CustomerService;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
  @SuppressWarnings("unused")
  private transient final Logger logger = LoggerFactory.getLogger(this
      .getClass());
  private PagerHibernateTemplate<Customer, Long> customerDao;
 
  @Autowired
  public void setSessionFactory(
      @Qualifier("sessionFactory") SessionFactory sessionfactory) {
    customerDao = new PagerHibernateTemplate<Customer, Long>(sessionfactory,
        Customer.class);
  }

  @Override
  public Customer findById(Long id) {
    return (Customer) customerDao.getSession().get(Customer.class, id);
  }

  @Override
  public Customer load(Long id) {
    return customerDao.get(id);
  }

  @Override
  public Customer save(Customer entity) {
    customerDao.save(entity);
    return entity;
  }

  @Override
  public Customer update(Customer entity) {
    customerDao.save(entity);
    return entity;
  }

  @Transactional
  @Override
  public void delete(Customer entity) {
    customerDao.delete(entity);
  }

  @Override
  public Page<Customer> getCustomers(Page<Customer> page, String name,
      String email, Calendar beginTime, Calendar endTime) {
    Criteria criteria = customerDao.createCriteria();
    if (name != null && !name.isEmpty()) {
      criteria.add(Restrictions.like("name", "%" + name + "%"));
    }
    if (email != null && !email.isEmpty()) {
      criteria.add(Restrictions.like("email", "%" + email + "%"));
    }
    if (beginTime != null) {
      criteria.add(Restrictions.ge("registerTime", beginTime));
    }
    if (endTime != null) {
      criteria.add(Restrictions.le("registerTime", endTime));
    }
    page = customerDao.findByCriteria(page, criteria);
    return page;
  }

  @Override
  public Customer getCustomerByName(String username) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("name", username));
    if (criteria.list().size() > 0)
      return (Customer) criteria.list().get(0);
    return null;
  }
  
  @Override
  public Customer getCustomerByEmail(String email) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("email", email));
    if (criteria.list().size() > 0)
      return (Customer) criteria.list().get(0);
    return null;
  }
  
  @Override
  public Customer getCustomerByPhoneNumber(String phoneNumber) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("phoneNumber", phoneNumber));
    if (criteria.list().size() > 0)
      return (Customer) criteria.list().get(0);
    return null;
  }
  
  @Override
  public Customer getCustomerByUid(String uid, String uidType) {
    Criteria criteria = customerDao.createCriteria();
    if (uidType.equalsIgnoreCase("qq")) {
      criteria.add(Restrictions.eq("uidQQ", uid));
    } else if (uidType.equalsIgnoreCase("weibo")) {
      criteria.add(Restrictions.eq("uidWeibo", uid));
    } else if (uidType.equalsIgnoreCase("weixin")) {
      criteria.add(Restrictions.eq("uidWeixin", uid));
    } else {
      return null;
    }
    if (criteria.list().size() > 0)
      return (Customer) criteria.list().get(0);
    return null;
  }
  
  @Override
  public boolean isUserExisted(String username) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("name", username).ignoreCase());
    return criteria.list().size() > 0;
  }

  @Override
  public boolean isEmailExisted(String email) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("email", email).ignoreCase());
    return criteria.list().size() > 0;
  }

  @Override
  public boolean isPhoneExisted(String phoneNumber) {
    Criteria criteria = customerDao.createCriteria();
    criteria.add(Restrictions.eq("phoneNumber", phoneNumber).ignoreCase());
    return criteria.list().size() > 0;
  }
}

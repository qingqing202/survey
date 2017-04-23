package com.nimbus.service;

import java.io.Serializable;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface BaseService<T extends Serializable> {
  @Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
  public T findById(Long id);

  @Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
  public T load(Long id);

  public T save(T entity);

  public T update(T entity);

  public void delete(T entity);
}

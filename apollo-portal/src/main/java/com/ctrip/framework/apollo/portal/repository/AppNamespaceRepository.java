package com.ctrip.framework.apollo.portal.repository;

import com.ctrip.framework.apollo.common.entity.AppNamespace;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AppNamespaceRepository extends PagingAndSortingRepository<AppNamespace, Long> {

  AppNamespace findByAppIdAndName(String appId, String namespaceName);

  AppNamespace findByName(String namespaceName);

  List<AppNamespace> findByNameAndIsPublic(String namespaceName, boolean isPublic);

  List<AppNamespace> findByIsPublicTrue();

  List<AppNamespace> findByAppId(String appId);

  @Modifying
  @Query("UPDATE AppNamespace SET deleted=true, last_modified_by=?2 WHERE app_id=?1")
  int batchDeleteByAppId(String appId, String operator);

  @Modifying
  @Query("UPDATE AppNamespace SET deleted=true, last_modified_by=?3 WHERE app_id=?1 and name=?2")
  int delete(String appId, String namespaceName, String operator);
}

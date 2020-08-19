package com.ctrip.framework.apollo.biz.repository;

import com.ctrip.framework.apollo.biz.entity.InstanceConfig;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;
import java.util.Set;

public interface InstanceConfigRepository extends PagingAndSortingRepository<InstanceConfig, Long> {

  InstanceConfig findByInstanceIdAndConfigAppIdAndConfigNamespaceName(long instanceId, String
      configAppId, String configNamespaceName);

  Page<InstanceConfig> findByReleaseKeyAndDataChangeLastModifiedTimeAfter(String releaseKey, Date
      validDate, Pageable pageable);

  Page<InstanceConfig> findByConfigAppIdAndConfigClusterNameAndConfigNamespaceNameAndDataChangeLastModifiedTimeAfter(
      String appId, String clusterName, String namespaceName, Date validDate, Pageable pageable);

  List<InstanceConfig> findByConfigAppIdAndConfigClusterNameAndConfigNamespaceNameAndDataChangeLastModifiedTimeAfterAndReleaseKeyNotIn(
      String appId, String clusterName, String namespaceName, Date validDate, Set<String> releaseKey);

  @Modifying
  @Query("delete from InstanceConfig  where config_app_id=?1 and config_cluster_name=?2 and config_namespace_name = ?3")
  int batchDelete(String appId, String clusterName, String namespaceName);

  @Query(
      value = "select b.Id from instance_config a inner join instance b on b.id =" +
          " a.instance_id where a.config_app_id = :configAppId and a.config_cluster_name = " +
          ":clusterName and a.config_namespace_name = :namespaceName and a.last_modified_time " +
          "> :validDate and b.app_id = :instanceAppId",
      countQuery = "select count(1) from instance_config a inner join instance b on b.id =" +
              " a.instance_id where a.config_app_id = :configAppId and a.config_cluster_name = " +
              ":clusterName and a.config_namespace_name = :namespaceName and a.last_modified_time " +
              "> :validDate and b.app_id = :instanceAppId",
      nativeQuery = true)
  Page<Object> findInstanceIdsByNamespaceAndInstanceAppId(
      @Param("instanceAppId") String instanceAppId, @Param("configAppId") String configAppId,
      @Param("clusterName") String clusterName, @Param("namespaceName") String namespaceName,
      @Param("validDate") Date validDate, Pageable pageable);
}

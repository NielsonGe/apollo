package com.ctrip.framework.apollo.biz.repository;

import com.ctrip.framework.apollo.biz.entity.Commit;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface CommitRepository extends PagingAndSortingRepository<Commit, Long> {

  List<Commit> findByAppIdAndClusterNameAndNamespaceNameOrderByIdDesc(String appId, String clusterName,
                                                                      String namespaceName, Pageable pageable);

  @Modifying
  @Query("update Commit set deleted=1, last_modified_by=?4 where app_id=?1 and cluster_name=?2 and namespace_name=?3")
  int batchDelete(String appId, String clusterName, String namespaceName, String operator);

}

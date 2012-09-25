// Copyright 2012 Yandex

#ifndef LTR_LEARNERS_DECISION_TREE_VERTEX_LEAF_VERTEX_H_
#define LTR_LEARNERS_DECISION_TREE_VERTEX_LEAF_VERTEX_H_

#include <string>

#include "ltr/learners/decision_tree/vertex/vertex.h"

namespace ltr {
namespace decision_tree {
/**
 * LeafVertex is a node, which returns constant value for any object.
 * Surprisingly it has no children.
 */
class LeafVertex : public Vertex {
 public:
  typedef ltr::utility::shared_ptr<LeafVertex> Ptr;

  explicit LeafVertex(double value) : value_(value) {}

  double value(const Object& object) const;

  void set_value(double value);

  string generateVertexCppCode(
    const string& function_name, int level_id, int vertex_id) const;

 private:
  virtual string getDefaultAlias() const;

  double value_;
};
};
};

#endif  // LTR_LEARNERS_DECISION_TREE_VERTEX_LEAF_VERTEX_H_

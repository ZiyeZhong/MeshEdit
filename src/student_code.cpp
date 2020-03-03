#include "student_code.h"
#include "mutablePriorityQueue.h"

using namespace std;

namespace CGL
{

  /**
   * Evaluates one step of the de Casteljau's algorithm using the given points and
   * the scalar parameter t (class member).
   *
   * @param points A vector of points in 2D
   * @return A vector containing intermediate points or the final interpolated vector
   */
Vector2D lerp(Vector2D p1, Vector2D p2, float t) {
    return (p1 * (1 - t) + p2 * t);
}

  std::vector<Vector2D> BezierCurve::evaluateStep(std::vector<Vector2D> const &points)
  { 
    // TODO Part 1.
      std::vector<Vector2D> new_points;
      for (int i = 0; i < points.size() - 1; i++) {
          new_points.push_back(lerp(points[i], points[i + 1], t));
      }
    return new_points;
  }

  /**
   * Evaluates one step of the de Casteljau's algorithm using the given points and
   * the scalar parameter t (function parameter).
   *
   * @param points    A vector of points in 3D
   * @param t         Scalar interpolation parameter
   * @return A vector containing intermediate points or the final interpolated vector
   */
Vector3D lerp(Vector3D p1, Vector3D p2, float t) {
    return (p1 * (1 - t) + p2 * t);
}

  std::vector<Vector3D> BezierPatch::evaluateStep(std::vector<Vector3D> const &points, double t) const
  {
    // TODO Part 2.
      std::vector<Vector3D> new_points;
      for (int i = 0; i < points.size() - 1; i++) {
          new_points.push_back(lerp(points[i], points[i + 1], t));
      }
    return new_points;
  }

  /**
   * Fully evaluates de Casteljau's algorithm for a vector of points at scalar parameter t
   *
   * @param points    A vector of points in 3D
   * @param t         Scalar interpolation parameter
   * @return Final interpolated vector
   */
  Vector3D BezierPatch::evaluate1D(std::vector<Vector3D> const &points, double t) const
  {
    // TODO Part 2.
      if (points.size() == 1) {
          return points[0];
      } else {
          return evaluate1D(evaluateStep(points, t), t);
      }
  }

  /**
   * Evaluates the Bezier patch at parameter (u, v)
   *
   * @param u         Scalar interpolation parameter
   * @param v         Scalar interpolation parameter (along the other axis)
   * @return Final interpolated vector
   */
  Vector3D BezierPatch::evaluate(double u, double v) const 
  {  
    // TODO Part 2.
      std::vector<Vector3D> pt_v;
      for (int i = 0; i < controlPoints.size(); i++){
            pt_v.push_back(evaluate1D(controlPoints[i], u));
      }
    return evaluate1D(pt_v, v);
  }

Vector3D weightNorm(Vector3D a, Vector3D b, Vector3D c) {
    return cross(b-a,c-a);
}

  Vector3D Vertex::normal( void ) const
  {
    // TODO Part 3.
    // Returns an approximate unit normal at this vertex, computed by
    // taking the area-weighted average of the normals of neighboring
    // triangles, then normalizing.
      Vector3D normal = Vector3D(0, 0, 0);
      HalfedgeCIter h = halfedge();
      do {
          HalfedgeCIter edge = h->twin();
          Vector3D w = weightNorm(position, edge->vertex()->position, h->next()->twin()->vertex()->position);
          normal += w;
          h = h->next();
      } while (h != halfedge());
    return normal.unit();
  }

  EdgeIter HalfedgeMesh::flipEdge( EdgeIter e0 )
  {
    // TODO Part 4.
    // This method should flip the given edge and return an iterator to the flipped edge.
      HalfedgeIter bc_ad = e0->halfedge();
      HalfedgeIter cb_da = bc_ad->twin();
      FaceIter f1 = bc_ad->face();
      FaceIter f2 = cb_da->face();

      if (f1->isBoundary() || f2->isBoundary() || bc_ad->isBoundary() || cb_da->isBoundary()) {return e0;}

      HalfedgeIter ca = bc_ad->next();
      HalfedgeIter ab = ca->next();
      HalfedgeIter bd = cb_da->next();
      HalfedgeIter dc = bd->next();
      HalfedgeIter ac = ca->twin();
      HalfedgeIter ba = ab->twin();
      HalfedgeIter db = bd->twin();
      HalfedgeIter cd = dc->twin();

      VertexIter b = bc_ad->vertex();
      VertexIter c = cb_da->vertex();
      VertexIter a = ab->vertex();
      VertexIter d = dc->vertex();

      EdgeIter e_ca = ca->edge();
      EdgeIter e_ab = ab->edge();
      EdgeIter e_dc = dc->edge();
      EdgeIter e_bd = bd->edge();

      bc_ad->setNeighbors(dc, cb_da, a, e0, f1);
      cb_da->setNeighbors(ab, bc_ad, d, e0, f2);
      ca->setNeighbors(bc_ad, ac, c, e_ca, f1);
      dc->setNeighbors(ca, cd, d, e_dc, f1);
      ab->setNeighbors(bd, ba, a, e_ab, f2);
      bd->setNeighbors(cb_da, db, b, e_bd, f2);
      ac->setNeighbors(ac->next(), ca, a, e_ca, ac->face());
      cd->setNeighbors(cd->next(), dc, c, e_dc, cd->face());
      ba->setNeighbors(ba->next(), ab, b, e_ab, ba->face());
      db->setNeighbors(db->next(), bd, d, e_bd, db->face());

      a->halfedge() = bc_ad;
      b->halfedge() = bd;
      c->halfedge() = ca;
      d->halfedge() = cb_da;

      e_ca->halfedge() = ca;
      e_ab->halfedge() = ab;
      e0->halfedge() = bc_ad;
      e_dc->halfedge() = dc;
      e_bd->halfedge() = bd;

      f1->halfedge() = bc_ad;
      f2->halfedge() = cb_da;
      
    return e0;
  }

  VertexIter HalfedgeMesh::splitEdge( EdgeIter e0 )
  {
    // TODO Part 5.
    // This method should split the given edge and return an iterator to the newly inserted vertex.
    // The halfedge of this vertex should point along the edge that was split, rather than the new edges.
      HalfedgeIter bc_bm = e0->halfedge();
      HalfedgeIter cb_mb = bc_bm->twin();
      FaceIter f1 = bc_bm->face();
      FaceIter f2 = cb_mb->face();

      if (f1->isBoundary() || f2->isBoundary() || bc_bm->isBoundary() || cb_mb->isBoundary()) {return VertexIter();}

      HalfedgeIter ca = bc_bm->next();
      HalfedgeIter ab = ca->next();
      HalfedgeIter bd = cb_mb->next();
      HalfedgeIter dc = bd->next();
      HalfedgeIter ac = ca->twin();
      HalfedgeIter ba = ab->twin();
      HalfedgeIter db = bd->twin();
      HalfedgeIter cd = dc->twin();

      VertexIter b = bc_bm->vertex();
      VertexIter c = cb_mb->vertex();
      VertexIter a = ab->vertex();
      VertexIter d = dc->vertex();

      EdgeIter e_ca = ca->edge();
      EdgeIter e_ab = ab->edge();
      EdgeIter e_dc = dc->edge();
      EdgeIter e_bd = bd->edge();

      HalfedgeIter cm = newHalfedge();
      HalfedgeIter mc = newHalfedge();
      HalfedgeIter am = newHalfedge();
      HalfedgeIter ma = newHalfedge();
      HalfedgeIter md = newHalfedge();
      HalfedgeIter dm = newHalfedge();
      VertexIter m = newVertex();
      m->position = (c->position + b->position) / 2;
      m->halfedge() = cb_mb;
      EdgeIter e_am = newEdge();
      EdgeIter e_md = newEdge();
      EdgeIter e_cm = newEdge();
      FaceIter f3 = newFace();
      FaceIter f4 = newFace();


      bc_bm->setNeighbors(ma, cb_mb, b, e0, f1);
      cb_mb->setNeighbors(bd, bc_bm, m, e0, f2);
      ca->setNeighbors(am, ac, c, e_ca, f3);
      dc->setNeighbors(cm, cd, d, e_dc, f4);
      ab->setNeighbors(bc_bm, ba, a, e_ab, f1);
      bd->setNeighbors(dm, db, b, e_bd, f2);
      ac->setNeighbors(ac->next(), ca, a, e_ca, ac->face());
      cd->setNeighbors(cd->next(), dc, c, e_dc, cd->face());
      ba->setNeighbors(ba->next(), ab, b, e_ab, ba->face());
      db->setNeighbors(db->next(), bd, d, e_bd, db->face());
      cm->setNeighbors(md, mc, c, e_cm, f4);
      mc->setNeighbors(ca, cm, m, e_cm, f3);
      am->setNeighbors(mc, ma, a, e_am, f3);
      ma->setNeighbors(ab, am, m, e_am, f1);
      md->setNeighbors(dc, dm, m, e_md, f4);
      dm->setNeighbors(cb_mb, md, d, e_md, f2);

      a->halfedge() = am;
      b->halfedge() = bc_bm;
      c->halfedge() = cm;
      d->halfedge() = dm;
      m->halfedge() = mc;

      e_ca->halfedge() = ca;
      e_ab->halfedge() = ab;
      e_dc->halfedge() = dc;
      e_bd->halfedge() = bd;
      e0->halfedge() = bc_bm;
      e_am->halfedge() = am;
      e_md->halfedge() = md;
      e_cm->halfedge() = cm;

      f1->halfedge() = bc_bm;
      f2->halfedge() = cb_mb;
      f3->halfedge() = mc;
      f4->halfedge() = cm;

//      e_ca->isNew = false;
//      e_ab->isNew = false;
//      e_dc->isNew = false;
//      e_bd->isNew = false;
      e0->isNew = false;
      e_am->isNew = true;
      e_md->isNew = true;
      e_cm->isNew = false;

      m->isNew = true;

      return m;
      
  }



  void MeshResampler::upsample( HalfedgeMesh& mesh )
  {
    // TODO Part 6.
    // This routine should increase the number of triangles in the mesh using Loop subdivision.
      for (VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++) {
          v->isNew = false;
          v->newPosition = v->position;
          Vector3D neighbour_sum = Vector3D(0, 0, 0);
          HalfedgeIter h = v->halfedge();
          do {
              HalfedgeIter h_twin = h->twin();
              neighbour_sum += h_twin->vertex()->position;
              h = h_twin->next();
          } while (h != v->halfedge());
          int n = v->degree();
          float u;
          if (n == 3) {
              u = 3.0/16.0;
          } else {
              u = 3.0 / (8 * n);
          }
          v->newPosition = ((1 - n * u) * v->position + u * neighbour_sum);
      }

      for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) {
          e->isNew = false;
          e->newPosition = Vector3D(0, 0, 0);
          VertexIter v_a = e->halfedge()->vertex();
          VertexIter v_b = e->halfedge()->twin()->vertex();
          VertexIter v_c = e->halfedge()->next()->twin()->vertex();
          VertexIter v_d = e->halfedge()->twin()->next()->twin()->vertex();
          e->newPosition = ((v_a->position + v_b->position) * 3 + (v_c->position + v_d->position)) / 8;
      }

      for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) {
          if (e->halfedge()->vertex()->isNew == false && e->halfedge()->twin()->vertex()->isNew == false) {
              VertexIter v = mesh.splitEdge(e);
              v->newPosition = e->newPosition;
          }
      }
      for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) {
          if (e->isNew == true) {
              if ((e->halfedge()->vertex()->isNew == true && e->halfedge()->twin()->vertex()->isNew == false) || (e->halfedge()->twin()->vertex()->isNew == true && e->halfedge()->vertex()->isNew == false))
            mesh.flipEdge(e);
          }
      }

      for (VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++) {
          v->position = v->newPosition;
      }
    }

}

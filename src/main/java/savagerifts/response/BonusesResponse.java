package savagerifts.response;

import savagerifts.model.edge.Edge;

public class BonusesResponse {
    Iterable<Edge> edges;
    Integer pointsRemaining;

    public Iterable<Edge> getEdges() {
        return edges;
    }
    public void setEdges(Iterable<Edge> edges) {
        this.edges = edges;
    }

    public Integer getPointsRemaining() {
        return pointsRemaining;
    }
    public void setPointsRemaining(Integer pointsRemaining) {
        this.pointsRemaining = pointsRemaining;
    }
}

module EsriShapefile
  class Ring
    attr_reader :points, :direction

    def initialize(points)
      @points = points
      @direction = determine_direction(points)
    end

    private

    # Sum over the edges, (x2 − x1)(y2 + y1). If the result is positive the
    # curve is clockwise, if it's negative the curve is counter-clockwise. (The
    # result is twice the enclosed area, with a +/- convention.)
    #
    # point[0] = (5,0)   edge[0]: (6-5)(4+0) =   4
    # point[1] = (6,4)   edge[1]: (4-6)(5+4) = -18
    # point[2] = (4,5)   edge[2]: (1-4)(5+5) = -30
    # point[3] = (1,5)   edge[3]: (1-1)(0+5) =   0
    # point[4] = (1,0)   edge[4]: (5-1)(0+0) =   0
    #                                          ---
    #                                          -44 counter-clockwise
    def determine_direction(points)
      sum_over_edges = points.
        each_cons(2).
        reduce(0) { |sum, (p1, p2)| sum += ((p2.x - p1.x) * (p2.y + p1.y)) }

      sum_over_edges < 0 ? :count_clockwise : :clockwise
    end

    def eql?(ring)
      ring.is_a?(Ring) && ring.points == @points && ring.direction == @direction
    end
    alias_method :==, :eql?

  end
end


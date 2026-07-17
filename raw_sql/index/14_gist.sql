-- ============================================================
-- Problem: GiST Index
-- ============================================================
--
-- A hotel booking system stores booking periods using TSRANGE.
--
-- Users frequently search for bookings that overlap a given
-- time range.
--
-- Create the most appropriate PostgreSQL index and verify it
-- with EXPLAIN ANALYZE.
--
CREATE INDEX idx_booking_period
ON room_bookings
USING GIST(booking_period);

ANALYZE room_bookings;

EXPLAIN ANALYZE
SELECT *
FROM room_bookings
WHERE booking_period &&
      tsrange(
          '2026-02-15 10:00',
          '2026-02-15 11:00'
      );
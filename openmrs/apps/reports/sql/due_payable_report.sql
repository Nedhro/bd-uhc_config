select
        sa_order.id,
        sa_order.display_name,
        sa_order."Total Sales",
        payment."Total Payment",
        (sa_order."Total Sales"-payment."Total Payment") as "Difference (sale-payment)"
from
(
    select
        rp.id,
        rp.display_name,
        sum(so.amount_total) as "Total Sales"
    from sale_order as so
             join res_partner rp on so.partner_id = rp.id
    group by so.partner_id, rp.id, so.state having so.state='done'
    ) as sa_order
join (select
          pay.partner_id,
          sum(pay.amount) as "Total Payment"
      from account_payment as pay
      where pay.state='posted' and pay.partner_type='customer'
      group by pay.partner_id) as payment on payment.partner_id=sa_order.id

where (sa_order."Total Sales"-payment."Total Payment") != 0;
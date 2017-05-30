SELECT 
b.nu_pedido_pu, 
b.nu_secu_ord_pu, 
fx_alta,
CASE
                               WHEN co_estado_subp = 'A1' AND co_subestado_subp_pu = 'AN' THEN 'AN'
                               WHEN co_estado_subp = 'A1' AND co_subestado_subp_pu = 'SA' THEN 'AN'
                               WHEN co_estado_subp = 'C1' AND co_subestado_subp_pu = 'FI' THEN 'CO'
                               WHEN co_estado_subp IN ( '1I', '1A')  AND co_subestado_subp_pu = '1A' AND co_estado_pu IN ('0I', '07','0A')  THEN 'CO'
                               WHEN co_estado_subp IN ( '1I', '1A')  AND co_subestado_subp_pu = '1A' AND co_estado_pu IN ( 'A1','09','08','A0') THEN 'AN'
                               ELSE 'provision'
                END co_estado_solc_scm_calc
FROM dwgravp0.dwycpuvt a
JOIN dwgravp0.dwpusevt b
ON
a.nu_pedido_pu=b.nu_pedido_pu     AND
        a.nu_subpedido_pu=b.nu_subpedido_pu     AND
        a.nu_servicio_pu=b.nu_servicio_pu
WHERE co_prse = '50478' AND nu_contratable = '1' AND co_op_comercial IN( '001','204')
GROUP BY 1,2,3,4




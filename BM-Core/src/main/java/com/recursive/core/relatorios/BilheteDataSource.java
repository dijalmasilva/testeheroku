/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recursive.core.relatorios;

import com.recursive.entidades.entidades.Aposta;
import com.recursive.entidades.entidades.Bilhete;
import java.util.Iterator;
import java.util.List;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 *
 * @author Marcelo Augusto
 */
public class BilheteDataSource implements JRDataSource{

    private Iterator<Aposta> apostas;
    private Aposta cursor;
    
    public BilheteDataSource(List<Aposta> apostas) {
        this.apostas = apostas.iterator();
    }

    @Override
    public boolean next() throws JRException {
        boolean temProximo = apostas.hasNext();
        if(temProximo){
            cursor = apostas.next();
        }
        return temProximo;
    }
    
    @Override
    public Object getFieldValue(JRField campo) throws JRException {
        if("jogo".equals(campo.getName()))
            return cursor.getJogo().getMandante().getNome() + " X " + cursor.getJogo().getVisitante().getNome();
        if("dataJogo".equals(campo.getName()))
            return cursor.getJogo().getData();
        if("cotacao".equals(campo.getName()))
            return cursor.getCotacaoEscolhida().getNome();
        
        return null;
    }
    
}

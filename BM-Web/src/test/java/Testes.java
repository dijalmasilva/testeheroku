

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.recursive.core.service.ApostadorService;
import com.recursive.entidades.entidades.Jogo;
import java.util.Date;
import javax.inject.Inject;
import org.junit.Assert;
import org.junit.Test;

/**
 *
 * @author Marcelo Augusto
 */
public class Testes {
    
    @Inject
    ApostadorService apostadorService;
    
    @Test
    public void jogoDisponivel(){
        Jogo jogo = new Jogo();
        Date data = new Date();
        jogo.setData(data);
        System.out.println(apostadorService == null);
       
        Assert.assertTrue(apostadorService.jogoDisponivel(jogo));
    }
//    @Test
//    public void listarJogosDisponíveis(){
//        for(Jogo jogo : apostadorService.listarJogosDisponiveis())
//            Assert.assertTrue(apostadorService.jogoDisponivel(jogo));
//    }
    
}

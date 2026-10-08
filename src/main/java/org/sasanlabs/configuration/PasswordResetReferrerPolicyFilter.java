package org.sasanlabs.configuration;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Overrides referrer policy on the reset page so level 7 can demonstrate full-URL referrer leakage
 * to third-party resources.
 */
@Component
@Order(Ordered.LOWEST_PRECEDENCE - 100)
public class PasswordResetReferrerPolicyFilter extends OncePerRequestFilter {

    private static final String RESET_PAGE_PATH = "/password-reset/reset.html";

    @Override
    protected void doFilterInternal(
            HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // The reset page URL carries the reset token: never leak it through the Referer header
        if (isResetPage(request)) {
            response.setHeader("Referrer-Policy", "no-referrer");
        }
        filterChain.doFilter(request, response);
    }

    private boolean isResetPage(HttpServletRequest request) {
        String requestUri = request.getRequestURI();
        return requestUri != null && requestUri.endsWith(RESET_PAGE_PATH);
    }
}
